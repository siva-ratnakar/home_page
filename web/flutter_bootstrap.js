{{flutter_js}}
{{flutter_build_config}}

// select loading div into a variable
const loadingBar = document.querySelector('#loading');
const loaderPercentage = document.querySelector('#percentage');

const additionalScripts = [
  // Add additional scripts here.
];

function injectScript(url) {
    return new Promise(function(resolve) {
        let scriptTag = document.createElement('script');
        scriptTag.src = url;
        scriptTag.type = 'application/javascript';
        scriptTag.onload = function() {
            resolve();
        };

        document.body.append(scriptTag);
    });
}

function beginPreloading(manifestAssets) {
    var assets = [
        'flutter.js',
        'main.dart.js',
        'canvaskit/canvaskit.wasm',
        'canvaskit/canvaskit.js',
        ...additionalScripts,
        ...manifestAssets,
    ];
    let totalAssets = assets.length + 1;
    let loaded = 0;

    const batchSize = 20;

    async function reportProgress() {
        loaded++;
        const value = Math.floor((loaded / totalAssets) * 100) + '%';
        loaderPercentage.innerHTML = value;
        // progressIndicator.style.width = value;

        if (assets.length == 0) {
            dispatchAppLoad();
        } else {
            load(assets.shift());
        }
    }

    function load(url) {
        const req = new XMLHttpRequest();
        req.onload = reportProgress;
        req.open('get', url);
        req.send();
    }

    function startBatch() {
        const end = Math.min(batchSize, assets.length);
        for (let i = 0; i < end; i++) {
            load(assets.shift());
        }
    }


    var scriptLoaded = false;
    async function dispatchAppLoad() {
        if (scriptLoaded) {
            return;
        }
        scriptLoaded = true;

        for (let i = 0; i < additionalScripts.length; i++) {
            await injectScript(additionalScripts[i]);
        }

        await injectScript('flutter.js');

        // Download main.dart.js
        _flutter.loader.load({
            serviceWorkerSettings: {
                serviceWorkerVersion: {{flutter_service_worker_version}},
            },
            onEntrypointLoaded: async function(engineInitializer) {
                const appRunner = await engineInitializer.initializeEngine();
        
                loading.classList.add('init_done');
                // run the app
                await appRunner.runApp();

                window.addEventListener("flutter-first-frame", function () {
                    // remove loading indicator
                    loadingBar.remove();
                    // document.body.classList.remove('loading-mode');
                });
        
                // Wait a few milliseconds so users can see the "zoooom" animation
                // before getting rid of the "loading" div.
                window.setTimeout(function() {
                    loading.remove();
                }, 200);
            }
        });
    }

    startBatch();
}

window.addEventListener('load', async function(ev) {
    const response = await fetch('assets/AssetManifest.json');
    const manifest = await response.json();
    const assets = Object.values(manifest)
            .map((list) => list.map((url) => 'assets/' + url))
            .reduce((arr, curr) => [...arr, ...curr], []);

    beginPreloading(assets);
});

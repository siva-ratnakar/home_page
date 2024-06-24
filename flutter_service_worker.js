'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "649f28c9e93e0d8dbb4379a7813431d6",
"icons/Icon-maskable-192.png": "5e6fd3082a09f5564b5bb0f17b48a4ce",
"icons/Icon-192.png": "4d0365511dc89d14af100757bbe32e27",
"icons/Icon-maskable-512.png": "75ba04b092217388a60319922efcdfd6",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"flutter_bootstrap.js": "c0f915fc0e37d7a81cdd9548bdfe06e0",
"version.json": "820dea50aaf241b8f00e42552c57f459",
"favicon.png": "f07d038905337240193e7bd4f9a4c2e9",
"main.dart.js": "6e96276de53c90ba2a5dccbaed0377eb",
"assets/NOTICES": "b4832ce5b20489a929aeda6a3da4f70c",
"assets/images/bioblog_move.png": "4000608cb24504d83c2d2ad5e52fa94e",
"assets/images/life_top.png": "9f186c3636dccc41abc0bf7128d7ce3d",
"assets/images/professional_mobile.png": "acf9aaaf007b64f1238abc622071de6f",
"assets/images/professional_back.png": "0988da4257d04b410cff9612189538cf",
"assets/images/professional/experience_logo.png": "6d7f9e77776c511c10228245cf24793b",
"assets/images/professional/awards_logo.png": "afd54c06f3cdde11dbfbe0046bd37ce6",
"assets/images/professional/publications_icon.png": "f452eb38a90687176b5bbc3d01318502",
"assets/images/professional/education_symbol.png": "9379784d46cce5ce629e640a39fd0b26",
"assets/images/life_back.png": "4b5629e369c99306f799ef740ebdb464",
"assets/images/social/x.png": "8b7d3289ddbfc7d01dd3ec3f47f6173e",
"assets/images/social/linkedIn.png": "dd1ca0bf9c16fdb8771ef5308a815e2f",
"assets/images/social/facebook.png": "d9712b131840f731972710523b337771",
"assets/images/social/github.png": "c3e3f6dc934318f6ce92e883719c3cce",
"assets/images/social/scholar_black.png": "38d39325f2c895ab2e40fa45d9dd04f7",
"assets/images/social/facebook_black.png": "39f7d7b9c316eaf79175bd5fcb50d1c6",
"assets/images/social/scholar.png": "a6f1d063f8e5ca30797d76501e345bbb",
"assets/images/social/github_black.png": "3b209e1b7c33be093eb961968c78d8ac",
"assets/images/social/instagram.png": "1bcd3163d6d59c3144d0b5597554f71d",
"assets/images/social/instagram_black.png": "ad1a483ae19d9462fab8d4dd1df261d6",
"assets/images/social/linkedIn_black.png": "9b5e8234c214f44c650da4492679ecce",
"assets/images/social/x_black.png": "e65d30de11f29c9fc59c18f0a07b8624",
"assets/images/bioblog_front.png": "62839f69752728f7744f7240908acdf7",
"assets/images/life_front.png": "86bfbda43ee1e9d87398d401f6bbc5ba",
"assets/images/bioblog_back.png": "e14b71839c5f42baca5828a7f4f7e5ba",
"assets/images/bioblog_top.png": "1e79bfe89811bc226afe7c79890580b6",
"assets/images/contact_move.png": "0b3abeae500ccbe25202741997cfbabb",
"assets/images/siva.jpg": "f020e01a21777ca8a585b5c3cf55f1e8",
"assets/images/contact_mobile.png": "658efb679fbc32ca113c7954c2408cc6",
"assets/images/professional_front.png": "f7cab7afab9f00695e94d33723c13768",
"assets/images/bioblog_mobile.png": "e53fae2516aaae3bc1e1fc6271c08ea7",
"assets/images/contact_front.png": "39e366352f8b2c51c5d277ea1c8a8683",
"assets/images/Life_move.png": "f7222619d1280a02f8f4d3c5ce9bd216",
"assets/images/professional_move.png": "10688eff6614d20f7a01179620f84990",
"assets/images/logo.png": "93f03cb79565ccf97c6ef3cbfd25321e",
"assets/images/life_mobile.png": "34cb09dfc99b4918c9f74139785e5989",
"assets/images/contact_back.png": "5f5be38530e5f2d66f923a64bdaf8d56",
"assets/AssetManifest.bin": "f755084d89a27d46d02176439bf6db4b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "7e454af65c92d7a67b03e3f797fe4d29",
"assets/AssetManifest.bin.json": "64bbe14f55d1fbe8cd49b4726d2b36f0",
"assets/FontManifest.json": "b98a119ee26e71f45c60bfb76904e5ca",
"assets/fonts/RubikDoodleShadow.ttf": "ada3eb3b10a011e7175954ec8ccec0f8",
"assets/fonts/Papyrus.ttf": "ffc718cd15e8caac3542af07605bf386",
"assets/fonts/IrishGrover.ttf": "3dd8c2215323670a6f0f19645ac0de6e",
"assets/fonts/MaterialIcons-Regular.otf": "2d1396d33fcd3a633232c0b73e66e8f4",
"assets/AssetManifest.json": "9286cdc275a9e65649480e59f04e055c",
"index.html": "45e35f8b9ce6aa7c2d9166a561aa1bd5",
"/": "45e35f8b9ce6aa7c2d9166a561aa1bd5",
"cv.pdf": "d10ca32cb1ae99ee4a6ec54672c539bc",
"favicon-32.png": "34eb955d6115367039705408d78a5b0b",
"contact.html": "0d671dabd43599ce46bf778a41e48849",
"manifest.json": "1fae6afac09b895a49d018b888e9f09f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

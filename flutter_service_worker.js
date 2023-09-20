'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.json": "d7eb1397a14ae5b11d6dcef1463af2e1",
"assets/images/logo.png": "25adb35e0fc273da3c009bf3325e5e32",
"assets/images/contact_move.png": "d55cdd21ff216d394ad28e7418a0a746",
"assets/images/professional_back.png": "f20fdc645a5cbfddaf77a3d11a5d9090",
"assets/images/contact_front.png": "fc8f43abc0c0b9c0b25d364b88f298fa",
"assets/images/social/x_black.png": "226e302bf8de4c80f6ffe1b268b30f09",
"assets/images/social/github.png": "0ce7bb812526006fc593669eae704a4e",
"assets/images/social/instagram_black.png": "5ddad87f897416fe4efe269782813d50",
"assets/images/social/x.png": "90763116e73a8ad039d40c446fede798",
"assets/images/social/facebook.png": "f407c31b217aac6e0cd4171092d53a8c",
"assets/images/social/github_black.png": "7edcddd8377c9c9dddef25425a780e6f",
"assets/images/social/scholar.png": "d1fc687750fd71ce9d60d9d03fbc9851",
"assets/images/social/facebook_black.png": "7059983735a5faa8ac6c0bae126f8a11",
"assets/images/social/instagram.png": "155275e0487c9bb43cdf2ae7ce3538ea",
"assets/images/social/linkedIn_black.png": "19c5df5da4e197c79c9f7e484b038f5f",
"assets/images/social/scholar_black.png": "94e631e182f57a1e392a1a820749fffd",
"assets/images/social/linkedIn.png": "34b2dccbb36c481bdd30234addbda21f",
"assets/images/contact_mobile.png": "86c82a55f9d158bef7482dd9d3063763",
"assets/images/bioblog_back.png": "04dcd97027dc4f87e1b33d2db52240f5",
"assets/images/bioblog_front.png": "e6a8f53b6f5f0f1afcc79c66728ceed3",
"assets/images/bioblog_move.png": "860c9d1428b639925ce9b5da091e5c73",
"assets/images/Life_move.png": "59da819492bdde52f30d79092e935ab4",
"assets/images/bioblog_mobile.png": "8ecde3195cf96e7652ef3d978019d3ba",
"assets/images/professional_front.png": "d44881210d3898328ba3c7bf8e093da5",
"assets/images/life_mobile.png": "18768366583985caa8511b38e8cea5c1",
"assets/images/life_top.png": "ad5c5718cbbd001def226f72d5eaeedc",
"assets/images/professional_move.png": "005dbb5ae8d5621263001552f225e304",
"assets/images/life_back.png": "9cf774a3d9780b3b534fade0e785ef44",
"assets/images/professional_mobile.png": "5a9db54e8feb4be57e4ee6e9b7f53d51",
"assets/images/life_front.png": "13fbea5d5507eb14cd80fc8a4e1b7fc5",
"assets/images/siva.jpg": "c0ed465d70c60513312d184413143a6a",
"assets/images/contact_back.png": "124376ee9d2ca757f0c0b502b5db6020",
"assets/images/bioblog_top.png": "e634892d950feda1055798ddd64b56e2",
"assets/NOTICES": "7a9b44fc0a322f465d071467bc41118c",
"assets/AssetManifest.bin": "4edb646179a1d3857a78bf0091e125dc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/fonts/Papyrus.ttf": "ffc718cd15e8caac3542af07605bf386",
"assets/fonts/IrishGrover.ttf": "3dd8c2215323670a6f0f19645ac0de6e",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/FontManifest.json": "85b128ab68b870fde82efe92a243e282",
"version.json": "820dea50aaf241b8f00e42552c57f459",
"icons/Icon-maskable-192.png": "5e6fd3082a09f5564b5bb0f17b48a4ce",
"icons/Icon-192.png": "4d0365511dc89d14af100757bbe32e27",
"icons/Icon-maskable-512.png": "75ba04b092217388a60319922efcdfd6",
"icons/Icon-512.png": "649f28c9e93e0d8dbb4379a7813431d6",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"index.html": "99e71a65d027393dcabf2826ee617cf1",
"/": "99e71a65d027393dcabf2826ee617cf1",
"favicon.png": "f07d038905337240193e7bd4f9a4c2e9",
"main.dart.js": "52c0131bb439af1345a044b32d2c80bc",
"favicon-32.png": "34eb955d6115367039705408d78a5b0b",
"manifest.json": "1fae6afac09b895a49d018b888e9f09f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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

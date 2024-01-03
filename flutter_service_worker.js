'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"manifest.json": "1fae6afac09b895a49d018b888e9f09f",
"Siva_CV.pdf": "d10ca32cb1ae99ee4a6ec54672c539bc",
"index.html": "64ed2635e527ce5828b842c531d5f6a8",
"/": "64ed2635e527ce5828b842c531d5f6a8",
"assets/AssetManifest.bin": "68fe06bf2aedcacf661d0349534eb023",
"assets/images/Life_move.png": "f7222619d1280a02f8f4d3c5ce9bd216",
"assets/images/bioblog_top.png": "1e79bfe89811bc226afe7c79890580b6",
"assets/images/professional_move.png": "10688eff6614d20f7a01179620f84990",
"assets/images/contact_mobile.png": "658efb679fbc32ca113c7954c2408cc6",
"assets/images/life_back.png": "4b5629e369c99306f799ef740ebdb464",
"assets/images/social/github.png": "c3e3f6dc934318f6ce92e883719c3cce",
"assets/images/social/facebook_black.png": "39f7d7b9c316eaf79175bd5fcb50d1c6",
"assets/images/social/x.png": "8b7d3289ddbfc7d01dd3ec3f47f6173e",
"assets/images/social/linkedIn_black.png": "9b5e8234c214f44c650da4492679ecce",
"assets/images/social/instagram.png": "1bcd3163d6d59c3144d0b5597554f71d",
"assets/images/social/scholar.png": "a6f1d063f8e5ca30797d76501e345bbb",
"assets/images/social/facebook.png": "d9712b131840f731972710523b337771",
"assets/images/social/instagram_black.png": "ad1a483ae19d9462fab8d4dd1df261d6",
"assets/images/social/scholar_black.png": "38d39325f2c895ab2e40fa45d9dd04f7",
"assets/images/social/x_black.png": "e65d30de11f29c9fc59c18f0a07b8624",
"assets/images/social/github_black.png": "3b209e1b7c33be093eb961968c78d8ac",
"assets/images/social/linkedIn.png": "dd1ca0bf9c16fdb8771ef5308a815e2f",
"assets/images/contact_move.png": "0b3abeae500ccbe25202741997cfbabb",
"assets/images/bioblog_back.png": "e14b71839c5f42baca5828a7f4f7e5ba",
"assets/images/bioblog_mobile.png": "e53fae2516aaae3bc1e1fc6271c08ea7",
"assets/images/professional_back.png": "0988da4257d04b410cff9612189538cf",
"assets/images/life_front.png": "86bfbda43ee1e9d87398d401f6bbc5ba",
"assets/images/life_mobile.png": "34cb09dfc99b4918c9f74139785e5989",
"assets/images/bioblog_move.png": "4000608cb24504d83c2d2ad5e52fa94e",
"assets/images/professional_front.png": "f7cab7afab9f00695e94d33723c13768",
"assets/images/contact_back.png": "5f5be38530e5f2d66f923a64bdaf8d56",
"assets/images/life_top.png": "9f186c3636dccc41abc0bf7128d7ce3d",
"assets/images/logo.png": "93f03cb79565ccf97c6ef3cbfd25321e",
"assets/images/bioblog_front.png": "62839f69752728f7744f7240908acdf7",
"assets/images/contact_front.png": "39e366352f8b2c51c5d277ea1c8a8683",
"assets/images/siva.jpg": "f020e01a21777ca8a585b5c3cf55f1e8",
"assets/images/professional_mobile.png": "acf9aaaf007b64f1238abc622071de6f",
"assets/fonts/IrishGrover.ttf": "3dd8c2215323670a6f0f19645ac0de6e",
"assets/fonts/Papyrus.ttf": "ffc718cd15e8caac3542af07605bf386",
"assets/fonts/BungeeShade.ttf": "cbebbd94583826d3866f2bd20ee74bf9",
"assets/fonts/MaterialIcons-Regular.otf": "22cb7026917c319c39edc06095b63f4c",
"assets/AssetManifest.bin.json": "ec401d4ac301daae33279d517795dbf5",
"assets/FontManifest.json": "a31e2c0daeb655f5ce71764648fe2d03",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/NOTICES": "56671c4f35234d259f469e1271bbb6e6",
"assets/AssetManifest.json": "acbacf24be1dcd1b56168116c586a05f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "7b634bc8912ee7f02501701b4e0ccc6b",
"contact.html": "0d671dabd43599ce46bf778a41e48849",
"favicon.png": "f07d038905337240193e7bd4f9a4c2e9",
"main.dart.js": "40ad966c6e783ea1db5fead02a58a9d4",
"favicon-32.png": "34eb955d6115367039705408d78a5b0b",
"version.json": "820dea50aaf241b8f00e42552c57f459",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"icons/Icon-512.png": "649f28c9e93e0d8dbb4379a7813431d6",
"icons/Icon-192.png": "4d0365511dc89d14af100757bbe32e27",
"icons/Icon-maskable-192.png": "5e6fd3082a09f5564b5bb0f17b48a4ce",
"icons/Icon-maskable-512.png": "75ba04b092217388a60319922efcdfd6"};
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

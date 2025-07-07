import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class EshopCacheManager {
  static final _cacheManager = CacheManager(
    Config(
      'imageCache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
    ),
  );

  // instance
  static CacheManager get imageCacheManager => _cacheManager;

  // clear the cache
  static Future<void> clearCache() async {
    await _cacheManager.emptyCache();
  }
}
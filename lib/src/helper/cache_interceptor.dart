import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final cacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  maxStale: const Duration(days: 1),
  priority: CachePriority.high,
  hitCacheOnErrorExcept: [401, 403],
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  cipher: null,
);
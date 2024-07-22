

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final cacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  maxStale: const Duration(days: 2),
  priority: CachePriority.normal,
  hitCacheOnErrorExcept: [401, 403],
  keyBuilder: (request) => request.uri.toString(),
  cipher: null,
);
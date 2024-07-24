

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final cacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  maxStale: const Duration(days: 2),
  priority: CachePriority.normal,
  hitCacheOnErrorExcept: [401, 403],
  keyBuilder: (request) {
    // If the request has a custom option set to bypass cache, generate a unique key
    if (request.extra['bypassCache'] == true) {
      return '${request.uri.toString()}-${DateTime.now().millisecondsSinceEpoch}';
    }
    // Otherwise, use the default URI as the key
    return request.uri.toString();
  },
  cipher: null,
);
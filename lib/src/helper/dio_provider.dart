import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:themby/src/helper/dio_interceptor.dart';
import 'package:themby/src/helper/logger_interceptor.dart';

import 'objectbox_cache_store.dart';
import 'objectbox_provider.dart';


part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "user-agent": "Themby/1.0.3",
          "content-type": "application/json",
        }
    )
  );


  final cacheOptions = CacheOptions(
    store: ref.read(memCacheStoreProvider),
    policy: CachePolicy.forceCache,
    maxStale: const Duration(days: 1),
    priority: CachePriority.high,
    hitCacheOnErrorExcept: [401, 403],
    keyBuilder: (request) {
      return request.uri.toString();
    },
  );

  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  dio.interceptors.add(DioInterceptor());
  dio.interceptors.add(LoggerInterceptor());
  return dio;
}

@riverpod
CacheStore memCacheStore(MemCacheStoreRef ref) {
  return MemCacheStore();
}
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:themby/src/helper/dio_interceptor.dart';
import 'package:themby/src/helper/logger_interceptor.dart';

import 'objectbox_cache_store.dart';
import 'objectbox_provider.dart';


part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {

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

  final dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "user-agent": "Themby/1.0.3",
          "content-type": "application/json",
        }
    )
  )
  // ..interceptors.add(DioCacheInterceptor(options: cacheOptions))
  ..interceptors.add(DioInterceptor())
  ..interceptors.add(LoggerInterceptor())
  ..httpClientAdapter = Http2Adapter(
    ConnectionManager(
      idleTimeout: const Duration(seconds: 10),
    ),
  );




  // dio.;
  // dio.interceptors.add(DioInterceptor());
  // dio.interceptors.add(LoggerInterceptor());
  // dio.httpClientAdapter = Http2Adapter(
  //   ConnectionManager(
  //     idleTimeout: const Duration(seconds: 10),
  //   ),
  // );

  return dio;
}

@riverpod
CacheStore memCacheStore(MemCacheStoreRef ref) {
  return MemCacheStore();
}
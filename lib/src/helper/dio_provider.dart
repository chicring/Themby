import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/helper/cache_interceptor.dart';
import 'package:themby/src/helper/logger_interceptor.dart';


part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "content-type": "application/json",
        }
    )
  );

  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  dio.interceptors.add(LoggerInterceptor());
  return dio;
}



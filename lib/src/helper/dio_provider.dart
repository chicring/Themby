import 'package:dio/dio.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/helper/dio_interceptor.dart';
import 'package:themby/src/helper/logger_interceptor.dart';
import 'package:themby/src/helper/package_info.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {

  final dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          "user-agent": "Themby/${ref.read(packageInfoProvider).version}",
          "content-type": "application/json",
        }
    )
  )
  ..interceptors.add(DioInterceptor())
  ..interceptors.add(LoggerInterceptor());

  return dio;
}

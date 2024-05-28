

import 'package:dio/dio.dart';
import 'package:themby/common/helper/default_interceptors_wrapper.dart';

class DioHelper{

  late final Dio _dio;

  static DioHelper? _instance;
  factory DioHelper() => _instance ??= DioHelper._init();

  DioHelper._init(){
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "content-type": "application/json",
        }
      )
    );

    //添加拦截器
    _dio.interceptors.add(DefaultInterceptorsWrapper());
  }



  // DioHelper(){
  //   _dio = Dio(
  //     BaseOptions(
  //       connectTimeout: const Duration(seconds: 30),
  //       receiveTimeout: const Duration(seconds: 30),
  //       headers: {
  //         "content-type": "application/json",
  //       }
  //     )
  //   );
  //
  // }

  Future<Response<T>> get<T>(
      String url,
      String path, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? params,
        Options? options
  }) async {
      final customOptions = options?.copyWith(
        headers: headers,
      );
      return _dio.getUri<T>(
        _buildUri(url, path, params),
        options: customOptions,
      );
  }

  Future<Response<T>> post<T>(
      String url,
      String path, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? params,
        Options? options,
        dynamic data,
      }) async {
    final customOptions = options?.copyWith(
      headers: headers,
    );
    return _dio.postUri<T>(
      _buildUri(url, path, params),
      data: data,
      options: customOptions,
    );
  }


  Uri _buildUri(String url, String path, Map<String, dynamic>? params){
    final uri = Uri.parse(url);
    return uri.replace(
      path: path,
      queryParameters: params,
    );
  }

}
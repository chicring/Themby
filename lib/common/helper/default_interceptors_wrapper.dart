

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'dio_custom_exception.dart';

/// 默认拦截器
class DefaultInterceptorsWrapper extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method.toUpperCase() == "POST" && options.data == null) {
      options.data = {};
    }
    debugPrint(
        "request:${options.method}\t url-->${options.baseUrl}${options.path}?${formattedUrl(options.queryParameters)}");
    debugPrint("${options.headers}");

    debugPrint("request:${options.method}\t data-->${options.data}");
    handler.next(options);
  }

  static String formattedUrl(params) {
    var urlParamsStr = "";
    if (params?.isNotEmpty ?? false) {
      var tempArr = [];
      params.forEach((k, v) {
        tempArr.add(k + '=' + v.toString());
      });
      urlParamsStr = tempArr.join('&');
    }
    return urlParamsStr;
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print("response: ${response.data}");
  //   return handler.next(response);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("Error: ${err.response}");
    final customException = DioCustomException.fromDioException(err);
    debugPrint("Error: ${customException.message}");
    SmartDialog.showToast(customException.message!);
    handler.next(err);
  }

}



import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DioInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String url = err.requestOptions.uri.toString();
    if (!url.contains('heartBeat')) {
      SmartDialog.showToast(
        await dioError(err),
        displayType: SmartToastType.onlyRefresh,
      );
    }
    super.onError(err, handler);
    handler.next(err);
  }

  static Future<String> dioError(DioException error) async {
    switch (error.type) {
      case DioExceptionType.badCertificate:
        return '证书有误！';
      case DioExceptionType.badResponse:
        return '服务器异常，请稍后重试！';
      case DioExceptionType.cancel:
        return '请求已被取消，请重新请求';
      case DioExceptionType.connectionError:
        return '连接错误，请检查网络设置';
      case DioExceptionType.connectionTimeout:
        return '网络连接超时，请检查网络设置';
      case DioExceptionType.receiveTimeout:
        return '响应超时，请稍后重试！';
      case DioExceptionType.sendTimeout:
        return '发送请求超时，请检查网络设置';
      case DioExceptionType.unknown:
        return '网络异常！';
    }
  }

  // static Future<String> checkConnect() async {
  //   final List<ConnectivityResult> connectivityResult =
  //   await Connectivity().checkConnectivity();
  //   if (connectivityResult.contains(ConnectivityResult.mobile)) {
  //     return '正在使用移动流量';
  //   } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
  //     return '正在使用wifi';
  //   } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
  //     return '正在使用局域网';
  //   } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
  //     return '正在使用代理网络';
  //   } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
  //     return '正在使用蓝牙网络';
  //   } else if (connectivityResult.contains(ConnectivityResult.other)) {
  //     return '正在使用其他网络';
  //   } else if (connectivityResult.contains(ConnectivityResult.none)) {
  //     return '未连接到任何网络';
  //   } else {
  //     return '';
  //   }
  // }
}
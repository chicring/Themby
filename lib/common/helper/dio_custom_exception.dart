import 'dart:io';

import 'package:dio/dio.dart';

class DioCustomException implements Exception {
  final int? code;
  final String? message;
  String? stackInfo;

  DioCustomException([this.code, this.message]);

  factory DioCustomException.fromDioException(DioException exception) {

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return BadRequestException(-1, "连接超时");
      case DioExceptionType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioExceptionType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioExceptionType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioExceptionType.badResponse:
        int? errorCode = exception.response?.statusCode;
        switch (errorCode) {
          case 400:
            return BadRequestException(errorCode, "请求语法错误");
          case 401:
            return UnauthorisedException(errorCode, "没有权限");
          case 403:
            return UnauthorisedException(errorCode, "服务器拒绝执行");
          case 404:
            return UnauthorisedException(errorCode, "请求资源不存在");
          case 405:
            return UnauthorisedException(errorCode, "请求方法被禁止");
          case 500:
            return UnauthorisedException(errorCode, "服务器内部错误");
          case 502:
            return UnauthorisedException(errorCode, "错误网关");
          case 503:
            return UnauthorisedException(errorCode, "服务器异常");
          case 504:
            return UnauthorisedException(errorCode, "网关超时");
          case 505:
            return UnauthorisedException(errorCode, "不支持HTTP协议请求");
          default:
            return DioCustomException(errorCode, exception.response?.statusMessage ?? '未知错误');
        }
      case DioExceptionType.connectionError:
        if (exception.error is SocketException) {
          return DisconnectException(-1, "网络未连接");
        } else {
          return DioCustomException(-1, "连接错误");
        }
      case DioExceptionType.badCertificate:
        return DioCustomException(-1, "证书错误");
      case DioExceptionType.unknown:
        return DioCustomException(-1, exception.error != null ? exception.error.toString() : "未知错误");
    }
  }

  // 将各种异常转换为ApiException方便进行统一处理
  factory DioCustomException.from(dynamic exception) {
    if (exception is DioException) {
      return DioCustomException.fromDioException(exception);
    } else if (exception is DioCustomException) {
      return exception;
    } else {
      return DioCustomException(-1, "未知错误")..stackInfo = exception.toString();
    }
  }

  @override
  String toString() {
    return 'ApiException{code: $code, message: $message, stackInfo: $stackInfo}';
  }
}

  /// 错误请求异常
  class BadRequestException extends DioCustomException {
    BadRequestException(super.code, super.message);
  }

  /// 未认证异常
  class UnauthorisedException extends DioCustomException {
    UnauthorisedException(super.code, super.message);
  }

  /// 未登录异常
  class NeedLoginException extends DioCustomException {
    NeedLoginException(super.code, super.message);
  }

  /// 网络未连接异常
  class DisconnectException extends DioCustomException {
    DisconnectException(super.code, super.message);
  }

  /// 应用需要强更
  class NeedUpdateException extends DioCustomException {
    NeedUpdateException(super.code, super.message);
  }

  /// 错误响应格式异常
  class ErrorResponseFormatException extends DioCustomException {
    ErrorResponseFormatException(super.code, super.message);
  }

  /// 未知响应类型异常
  class NotKnowResponseTypeException extends DioCustomException {
    NotKnowResponseTypeException(super.code, super.message);
  }


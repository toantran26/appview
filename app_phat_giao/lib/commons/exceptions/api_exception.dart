import 'dart:io';
import 'package:dio/dio.dart';
import 'package:app_phat_giao/@core/network/interceptor/token_interceptor.dart';
import 'response_error.dart';

class ApiException {
  String? errorCode;
  String errorMessage = "";
  DioError? exception;

  ApiException({this.exception}) {
    switch (exception?.type) {
      case DioErrorType.response:
        {
          dynamic errorBody = exception?.response?.data ?? "";
          try {
            // try to parse to response error
            ResponseError responseError = ResponseError.fromJson(errorBody);
            errorMessage = responseError.message;
            errorCode = responseError.errorCode;

            // map 401 to meaningful messages
            if (TokenInterceptor.unauthorizedTokenCodes
                .contains(responseError.statusCode)) {
              errorMessage = 'Thông tin không hợp lệ';
              return;
            }

            // map 500 to meaningful msg
            if (responseError.statusCode >= 400) {
              errorMessage = 'Lỗi hệ thống. Vui lòng thử lại';
              return;
            }
          } catch (e) {
            errorMessage = e.toString();

            // Try to get Dio internal error which might due to service not available
            if (exception?.error != null) {
              errorMessage = exception?.error?.toString() ?? "";
            }

            if (exception?.response?.statusMessage != null &&
                exception?.response?.statusMessage?.isNotEmpty == true) {
              errorMessage = exception?.response?.statusMessage ?? "";
            }
          }
        }
        break;
      default:
        {
          switch (exception?.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                errorMessage = 'Đã quá thời gian kết nối. Vui lòng thử lại';
              }
              break;
            default:
              {
                if (exception?.error is SocketException) {
                  errorMessage = 'Lỗi kết nối. Vui lòng thử lại';
                } else if (exception?.error is HttpException) {
                  errorMessage = 'Lỗi kết nối. Vui lòng thử lại';
                } else {
                  errorMessage = 'Lỗi hệ thống. Vui lòng thử lại';
                }
              }
          }
        }
    }
  }
}

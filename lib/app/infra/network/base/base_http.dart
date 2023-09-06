import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../domain_layer/domain_layer.dart';

class BaseHttp {
  late Dio dio;
  final GetAuthUseCase _getAuthUseCase;

  BaseHttp({
    required GetAuthUseCase getAuthUseCase,
  }) : _getAuthUseCase = getAuthUseCase {


    dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        'Content-Type': 'application/json',
      },
      baseUrl: '',
    );

    dio.interceptors.addAll(
      [
        PrettyDioLogger(responseBody: true, compact: true),
        InterceptorsWrapper(onError: _onError, onRequest: _onRequest),
      ],
    );
  }
  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  Future<void> _onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(error);
  }

  void logErrorToCrashlytics(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) {
    DioError error = _verify(dioError);

    handler.next(error);
  }

  DioError _verify(DioError dioError) {
    DioError myError = DioError(
      requestOptions: dioError.requestOptions,
      response: dioError.response,
      type: dioError.type,
    );

    var statusCode = dioError.response?.statusCode;

    switch (statusCode) {
      case HttpStatus.unauthorized:
        myError.error = 'Unauthorized Request!';
        return myError;

      case HttpStatus.forbidden:
        myError.error = 'Forbidden Request';
        return myError;

      case HttpStatus.internalServerError:
        myError.error = 'Internal Server Error';
        return myError;

      case HttpStatus.serviceUnavailable:
        myError.error = 'Service Unavailable';
        return myError;

      default:
        return myError;
    }
  }
}

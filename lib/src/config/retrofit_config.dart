
import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

late final Dio baseApiDio;

void setupRetrofitConfig() {
  _setupBaseApiDio();
}

void _setupBaseApiDio() {
  baseApiDio = Dio();

  // timeout 설정
  baseApiDio.options.connectTimeout = const Duration(seconds: 5);
  baseApiDio.options.receiveTimeout = const Duration(seconds: 3);

  // content-type 설정
  baseApiDio.options.contentType = 'application/json';

  // interceptors 추가
  baseApiDio.interceptors.add(_AuthorizationInterceptor());
  baseApiDio.interceptors.add(_CustomLogInterceptor());
}

// Authorization 관련
class _AuthorizationInterceptor extends Interceptor {
  String? accessToken;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (accessToken == null) {
      final storedAccessToken = await getIt.get<LocalKeyValueDataSource>().accessToken;
      accessToken = storedAccessToken;
    }

    if (accessToken != null) options.headers['Authorization'] = 'Bearer ${accessToken!}';
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      // refresh
    }
    super.onError(err, handler);
  }
}

// Log 관련
class _CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('REQUEST[${options.method}] => PATH: ${options.path}, ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}

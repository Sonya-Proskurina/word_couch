import 'package:dio/dio.dart';
import 'package:word_couch/apikey.dart';

import 'logger.dart';

class ApiClient {
  static const baseUrl = 'https://wordsapiv1.p.rapidapi.com';

  static final dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-RapidAPI-Key': APIKEY,
    'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com'
  }))
    ..interceptors.add(LoggerInterceptor());

  static Future<T?> get<T>(String request) async {
    var res = await dio.get<T>(request);
    T? data = res.data;
    if (data != null) {
      return data;
    }
    return Future.error('Error getting data');
  }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d("--> ${options.method} ${options.uri}\n"
        "Body: ${options.data}\n"
        "--> END ${options.method}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d("<-- ${response.statusCode} ${response.requestOptions.uri}\n"
        "Response: ${response.data}\n"
        "<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e("<-- Error -->\n"
        "Type: ${err.type}\n"
        "Message: ${err.message}\n"
        "<-- ${err.response?.statusCode} ${err.response?.requestOptions.uri}\n"
        "Response: ${err.response?.data}\n<-- END HTTP");
    return super.onError(err, handler);
  }
}

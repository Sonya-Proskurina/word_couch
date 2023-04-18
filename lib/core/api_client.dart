import 'package:dio/dio.dart';
import 'package:word_couch/apikey.dart';

import 'logger.dart';

abstract class ApiClient {
  Dio get dio;

  Future<T?> get<T>(String request,
      {Map<String, dynamic> query = const {}}) async {
    var res = await dio.get<T>(request, queryParameters: query);
    T? data = res.data;
    if (data != null) {
      return data;
    }
    return Future.error('Error getting data');
  }
}

class WordsApiClient extends ApiClient {
  static const baseUrl = 'https://wordsapiv1.p.rapidapi.com';

  @override
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-RapidAPI-Key': wordsApiKey,
    'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com'
  }))
    ..interceptors.add(LoggerInterceptor());

  Future<T?> random<T>() async {
    return super.get("words", query: { 'random' : true});
  }
}

class ImageApiClient extends ApiClient {
  static const baseUrl =
      'https://bing-image-search1.p.rapidapi.com/images/search';

  @override
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-RapidAPI-Key': imageApiKey,
    'X-RapidAPI-Host': 'bing-image-search1.p.rapidapi.com'
  }))
    ..interceptors.add(LoggerInterceptor());

  @override
  Future<T?> get<T>(String request, {Map<String, dynamic> query = const {}}) async {
    return super
        .get("", query: {'q': request, 'count': 1, 'safeSearch': 'Off'});
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

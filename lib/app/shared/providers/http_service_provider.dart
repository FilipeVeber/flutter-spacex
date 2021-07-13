import 'package:dio/dio.dart';
import 'package:flutter_spacex/app/shared/constants.dart';

class HttpServiceProvider {
  Dio _dio;

  HttpServiceProvider() {
    _dio = Dio(BaseOptions(baseUrl: Constants.BASE_URL));
    _initializeInterceptors();
  }

  _initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions request) {
      print("${request.uri}");
    }, onResponse: (Response<dynamic> response) {
      print("Response: $response");
    }, onError: (DioError error) {
      print("Error: $error");
    }));
  }

  Future<Response> doGet(String path) async {
    return _dio.get(path);
  }
}

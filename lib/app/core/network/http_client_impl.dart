import 'package:dio/dio.dart';

import 'http_client.dart';

class HttpDioClientImpl implements HttpClient<Response> {
  final Dio _dio;

  HttpDioClientImpl({required String baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<Response<T>> get<T>(String path) async {
    return await _dio.get(path);
  }
}

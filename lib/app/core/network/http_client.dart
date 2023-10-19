abstract interface class HttpClient<Response> {
  Future<Response> get<T>(String path);
}

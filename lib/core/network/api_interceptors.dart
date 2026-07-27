import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("STATUS : ${response.statusCode}");
    print("BODY : ${response.data}");
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
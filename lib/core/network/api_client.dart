import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(): dio = Dio(
      BaseOptions(
          baseUrl:'https://fitness-a21d.onrender.com/api/v1',
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            "Content-Type": "application/json",
          }
      ),
  ){
    //eta te hocche api theke asa accessToken ar refresh TOken esob handle kora
   // dio.interceptors.add();

  }

}
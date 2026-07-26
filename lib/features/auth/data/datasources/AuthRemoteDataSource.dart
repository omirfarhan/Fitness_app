import 'package:cleancodearchitecture/features/auth/data/model/login_request.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/ApiEndpoints.dart';
import '../../../../core/network/api_client.dart';
import '../model/registerrequest.dart';

class Authremotedatasource {
  final ApiClient api;
  Authremotedatasource(this.api);

  Future<dynamic> login(LoginRequest request)async{
    try{
      final response = await api.dio.post(
        Apiendpoints.login,
        data: request.toJson()
      );

      return response.data;

    }on DioException catch (e){
      _loginhandledioError(e);

    }catch (e){
      print('Unexpected error $e');
      rethrow;
    }
  }

  Future<dynamic> register(RegisterRequest request)async{

    try{
      final response =await api.dio.post(
          Apiendpoints.register,
          data: request.toJson()
      );
      return response.data;
    }on DioException catch (e){
      _handleDioError(e);
    }
    catch (e){
      print('Unexpected error $e');
      rethrow;
    }
  }

  dynamic _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;

    // 409 Conflict - Duplicate Email
    if (statusCode == 409) {
      String message = 'This email is already registered. '
          'Please try with a new email.';
      // Server থেকে আসা message ব্যবহার করুন
      if (responseData is Map && responseData.containsKey('message')) {
        message = responseData['message'];
      } else if (responseData is Map && responseData.containsKey('error')) {
        message = responseData['error'];
      }
      throw DuplicateEmailException(message);
    }
    // 400 Bad Request
    if (statusCode == 400) {
      String message = 'Invalid request. Please check your data.';

      if (responseData is Map && responseData.containsKey('message')) {
        message = responseData['message'];
      }
      throw BadRequestException(message);
    }
    if (statusCode == 500) {
      throw ServerException('Server error. Please try again later.');
    }
    // Network Error
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError){
      throw NetworkException('Network error. Please check your connection.');
    }
    throw GenericException('Registration failed. Please try again.');
  }

  void _loginhandledioError(DioException e) {
    final statusCode = e.response?.statusCode;

    if(statusCode == 403){
      String message = 'Access denied. You don’t have permission to sign in.';
      throw ForbiddenException(message);
    }
    if(statusCode == 404){
      String message = 'Email not registered. Try another one.';
      throw UserNotFoundException(message);
    }

    if(statusCode == 401){
      String message = 'Invalid credentials. Please check your email and password.';
      throw InvalidCredentialsException(message);
    }

    if(statusCode == 400){
      String message = 'Invalid request. Please check your data.';
      throw BadRequestException(message);
    }
    if(statusCode == 500){
      throw ServerException('Server error. Please try again later.');
    }
    if(e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError){
      throw NetworkException('Network error. Please check your connection.');
    }
    throw GenericException('Login failed. Please try again.');
  }



}
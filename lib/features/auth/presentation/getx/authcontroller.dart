import 'package:cleancodearchitecture/core/error/exception.dart';
import 'package:cleancodearchitecture/core/routes/app_routes.dart';
import 'package:cleancodearchitecture/features/auth/data/model/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/AuthRemoteDataSource.dart';
import '../../data/model/registerrequest.dart';

class  Authcontroller extends GetxController {
  final isLoading = false.obs;
  final errormessage =''.obs;

  //login page
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;

  //registration page
  final fullnameController = TextEditingController();
  final gmailController = TextEditingController();
  final passwordsController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    gmailController.dispose();
    passwordsController.dispose();
    super.onClose();
  } //final confirmPasswordsController = TextEditingController();


  Future<void> login()async{
    try{
      isLoading.value = true;
      errormessage.value= '';

      final response= LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text
      );

      final datasource = Authremotedatasource(ApiClient());
      await datasource.login(response);

      Get.snackbar(
        'Success',
        'Welcome back! User logged in successfully',
        duration: Duration(seconds: 3),
      );

      Get.offAllNamed(AppRoutes.homescreen);

    } on ForbiddenException catch (e){
      _handleForbiddenException(e.message);

    } on UserNotFoundException catch (e) {
      _handleUserNotFoundException(e.message);

    } on InvalidCredentialsException catch (e) {
      _handleInvalidCredentialsException(e.message);

    } on BadRequestException catch (e){
      _handleBadRequest(e.message);

    } on ServerException catch (e){
      _handleServerError(e.message);

    } on NetworkException catch (e){
      _handleNetworkError(e.message);

    } on GenericException catch (e){
      _handleUnknownError(e.message);

    } catch (e){
      errormessage.value = e.toString();
      Get.snackbar('Error', errormessage.value);
    }finally {
      isLoading.value = false;
    }
  }

  Future<void> register()async{
    try{
      isLoading.value = true;
      errormessage.value = '';

      final response = RegisterRequest(
        fullName: fullnameController.text.trim(),
        email: gmailController.text.trim(),
        password: passwordsController.text
      );

      //api call
      final datasource = Authremotedatasource(ApiClient());
      await datasource.register(response);

      Get.snackbar(
        'Success',
        'Registration successful! Please login.',
        duration: Duration(seconds: 3),
      );


    } on DuplicateEmailException catch (e){

      _handleDuplicateEmail(e.message);

    } on BadRequestException catch (e) {
      _handleBadRequest(e.message);

    } on ServerException catch (e){
      _handleServerError(e.message);

    }on NetworkException catch (e){
      _handleNetworkError(e.message);

    }on GenericException catch (e){
      _handleUnknownError(e.message);

    } catch (e){
      errormessage.value = e.toString();
      Get.snackbar('Error', errormessage.value);
    }finally {
      isLoading.value = false;
    }

  }

  void _handleInvalidCredentialsException(String message) {
    errormessage.value = message;
    print('InvalidCredentialsException');
    Get.snackbar(
      'InvalidCredentialsException',
      message,
      duration: Duration(seconds: 5),
    );

  }

  void _handleUserNotFoundException(String message) {
    errormessage.value = message;
    print('UserNotFoundException');
    Get.snackbar(
      'UserNotFoundException',
      message,
      duration: Duration(seconds: 5),
    );

  }

  void _handleForbiddenException(String message) {
    errormessage.value = message;
    print('ForbiddenException');
    Get.snackbar(
      'ForbiddenException',
      message,
      duration: Duration(seconds: 5),
    );

  }

  void _handleDuplicateEmail(String message) {
    errormessage.value = message;
    print('⚠️ Duplicate Email Detected!');
    Get.snackbar(
      'Email Already Exists',
      message,
      duration: Duration(seconds: 5),
    );

  }

  // 🔴 Bad Request Handler
  void _handleBadRequest(String message) {
    errormessage.value = message;
    Get.snackbar(
      'Invalid Data',
      message,
      duration: Duration(seconds: 4),
    );
  }

  // 🟠 Server Error Handler
  void _handleServerError(String message) {
    errormessage.value = message;

    Get.snackbar(
      '🔄 Server Error',
      message,
      duration: Duration(seconds: 4),
    );
  }

  // 📡 Network Error Handler
  void _handleNetworkError(String message) {
    errormessage.value = message;

    Get.snackbar(
      '📡 Network Error',
      message,
      duration: Duration(seconds: 4),
    );
  }

  // ❓ Unknown Error Handler
  void _handleUnknownError(String message) {
    errormessage.value = 'An unexpected error occurred';
    Get.snackbar(
      '⚠️ Error',
      'Something went wrong. Please try again.',
      duration: Duration(seconds: 4),
    );
  }


}
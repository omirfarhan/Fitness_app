import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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


  Future<void> register()async{
    try{
      isLoading.value = true;
      errormessage.value = '';

      final response = RegisterRequest(
        fullName: fullnameController.text.trim(),
        email: gmailController.text.trim(),
        password: passwordsController.text
      );

      //ekhane usecase add kora

      Get.snackbar('Success', 'Registration successful');


    }catch (e){
      errormessage.value = e.toString();
      Get.snackbar('Error', 'Registration failed: ${e.toString()}');
    }finally {
      isLoading.value = false;
    }

  }


}
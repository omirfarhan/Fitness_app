import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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
  //final confirmPasswordsController = TextEditingController();

  Future<void> register()async{
    try{
      isLoading.value = true;
      errormessage.value = '';



    }catch (e){
      errormessage.value = e.toString();
      Get.snackbar('Error', 'Registration failed: ${e.toString()}');
    }finally {
      isLoading.value = false;
    }

  }


}
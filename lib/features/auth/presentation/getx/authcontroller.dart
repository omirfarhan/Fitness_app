import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class  Authcontroller extends GetxController {
  //login page
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;

  //registration page
  final fullnameController = TextEditingController();
  final gmailController = TextEditingController();
  final passwordsController = TextEditingController();
  final confirmPasswordsController = TextEditingController();

}
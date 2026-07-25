import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/roundedfield.dart';
import '../widgets/sign_in_button.dart';
import 'login_page.dart';


class RegistrationPage extends GetView<Authcontroller>{
   RegistrationPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9E1F5),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFB9E1F5),
      //   title: const Text('Registration'),
      // ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: Get.back, icon: const Icon(Icons.arrow_back, color: Colors.white,)),

              ),
              Image.asset(
                'assets/picture/running_man.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25),
                          Column(
                            children: [
                              Roundedfield(
                                  controller: controller.fullnameController,
                                  hint: 'Full name',
                                  icon: Icons.drive_file_rename_outline_outlined,
                                  obscureText: false,
                                validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Full name required';
                                    }
                                    if(value.length < 4){
                                      return 'Full name must be at least 4 characters';
                                    }
                                    return null;
                                },
                              ),


                              const SizedBox(height: 13),

                              Roundedfield(
                                  controller: controller.gmailController,
                                  hint: 'Email',
                                  icon: Icons.email_outlined,
                                  obscureText: false,
                                validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Email required';
                                    }
                                    if(!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                                        .hasMatch(value)){
                                      return 'Enter a valid Gmail address';
                                    }
                                    return null;
                                },
                              ),
                              const SizedBox(height: 13),

                              Obx(() => Roundedfield(
                                controller: controller.passwordsController,
                                hint: 'Password',
                                icon: Icons.looks_outlined,
                                obscureText: controller.obscurePassword.value,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'Password required';
                                  }

                                  if(value.length < 6){
                                    return 'Password must be at least 6 characters';
                                  }

                                  return null;
                                },
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.obscurePassword.value = !controller
                                          .obscurePassword.value;
                                    },
                                    icon: Icon(
                                      controller.obscurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: Colors.grey,
                                    )
                                ),
                              ),
                              ),
                              const SizedBox(height: 18),

                              SignInButton(
                                  buttonName:'Sign up',
                                  isLoading: controller.isLoading.value,
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      controller.register();
                                    }
                                    print('Sign up button');
                                  },
                                backgroundColor:const Color(0xFF288AAA),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Do you have an account? ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => LoginPage());
                                      print('Do you have an account?');
                                    },

                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Color(0xFF1B2A56),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                  )
                                ],
                              ),

                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
              )
            ],
          )

      ),

    );

  }

}
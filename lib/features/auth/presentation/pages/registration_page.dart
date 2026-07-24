import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/roundedfield.dart';

class RegistrationPage extends GetView<Authcontroller>{
  const RegistrationPage({super.key});


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

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                          child: Column(
                            children: [
                              Roundedfield(
                                  controller: controller.emailController,
                                  hint: 'Full name',
                                  icon: Icons.drive_file_rename_outline_outlined,
                                  obscureText: false
                              ),
                              const SizedBox(height: 13),

                              Roundedfield(
                                  controller: controller.emailController,
                                  hint: 'Email',
                                  icon: Icons.email_outlined,
                                  obscureText: false
                              ),
                              const SizedBox(height: 13),

                              Obx(() => Roundedfield(
                                controller: controller.passwordController,
                                hint: 'Password',
                                icon: Icons.looks_outlined,
                                obscureText: controller.obscurePassword.value,
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

                              const SizedBox(height: 13),

                              Obx(() => Roundedfield(
                                controller: controller.passwordController,
                                hint: 'Current Password',
                                icon: Icons.looks_outlined,
                                obscureText: controller.obscurePassword.value,
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

                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {

                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1B2A56),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  elevation: 0,
                                ), child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Color(0xFFE0F4FF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                )),
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
                                      Get.to(() => const RegistrationPage());
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
                          )
                      ),
                    ],

                  ),
                ),
              )
            ],
          )

      ),

    );

  }

}
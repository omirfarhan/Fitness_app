import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:cleancodearchitecture/features/auth/presentation/pages/registration_page.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/roundedfield.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/sign_in_button.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends GetView<Authcontroller> {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFB9E1F5),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 25),
                            Roundedfield(
                                controller: controller.emailController,
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
                              controller: controller.passwordController,
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
                            const SizedBox(height: 13),
                        
                            SignInButton(
                              buttonName:'Sign in',
                              isLoading: controller.isLoading.value,
                              onPressed: () {
                                // if(_formKey.currentState!.validate()){
                                //   print('Sign in button');
                                // }

                                if(_formKey.currentState!.validate()){
                                  //controller.login();
                                }
                        
                              },
                              backgroundColor: const Color(0xFF1B2A56)
                            ),
                        
                            const SizedBox(height: 14),
                        
                            TextButton(
                              onPressed: () {
                                print('Forgot password?');
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: Color(0xFF1B2A56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                        
                            const SizedBox(height: 12),
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Socialbutton(
                                    icon: const FaIcon(
                                      FontAwesomeIcons.google,
                                    ),
                                    iconColor: const Color(0xFF045A9F),
                                    label: 'Sign In with Google',
                                    onTap: () {
                                      print('Google button pressed');
                                    },
                                )
                              ]
                            ),
                            const SizedBox(height: 20),
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                        
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => RegistrationPage());
                                    print('Sign up button');
                                  },
                        
                                  child: const Text(
                                    'Sign up',
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
                      ),
                    ),
                  )
              ),



            ],

          )
      )

    );

  }

}
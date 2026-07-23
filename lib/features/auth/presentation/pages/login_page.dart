import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/roundedfield.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 25),
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

                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                print('Login button pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B2A56),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xFFE0F4FF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
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
                  )
              ),



            ],

          )
      )

    );

  }

}
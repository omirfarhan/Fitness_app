import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:cleancodearchitecture/features/auth/presentation/widgets/roundedfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


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
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
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
                          Roundedfield(
                              controller: controller.passwordController,
                              hint: 'Password',
                              icon: Icons.looks_outlined,
                              obscureText: controller.obscurePassword,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.obscurePassword = !controller
                                        .obscurePassword;
                                    controller.update();
                                  },
                                  icon: Icon(
                                    controller.obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  )
                              ),
                          )
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
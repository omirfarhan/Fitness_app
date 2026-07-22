import 'package:cleancodearchitecture/features/auth/presentation/getx/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<Authcontroller> {
  const LoginPage({super.key});

  static const Color accentGreen = Color(0xFFB8E552); // continue button / accent
  static const Color darkBg = Color(0xFF0A0F0A);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: darkBg,

      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF25421B), // dark olive green (top)
                        Color(0xFF0A0F0A), // near black
                        Color(0xFF0A0F0A), // black (bottom)
                        ],
                    stops: [0.0, 0.45, 1.0],
                  ),
                ),
              ),
          ),

          // Soft glow blob behind the logo
          Positioned(
              top: -80,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                width: 320,
                height: 400,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      accentGreen.withOpacity(0.55),
                      accentGreen.withOpacity(0.0),
                    ],
                  ),
              )
                ),
              )
          ),


          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    )
                  ],

                ),
              )
          ),
        ],
      )

    );

  }

}
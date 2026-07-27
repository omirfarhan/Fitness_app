import 'package:cleancodearchitecture/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/getx/auth_service.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  int? priority = 1;


  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    final isLoggedin = authService.isLoggedIn;


// Logged in অবস্থায় কেউ login/register page-এ যেতে চাইলে home-এ পাঠিয়ে দিন
    if(isLoggedin && route == AppRoutes.login || route == AppRoutes.register){
      return const RouteSettings(name: AppRoutes.homescreen);
    }

    // Logged out অবস্থায় কেউ home-এ যেতে চাইলে login-এ পাঠিয়ে দিন
    if (!isLoggedin && route == AppRoutes.homescreen) {
      return const RouteSettings(name: AppRoutes.login);
    }



    return null;
  }
}
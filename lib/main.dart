import 'package:cleancodearchitecture/core/routes/app_routes.dart';
import 'package:cleancodearchitecture/features/auth/presentation/binding/auth_binding.dart';
import 'package:cleancodearchitecture/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     initialBinding: AuthBinding(),
     initialRoute: AppRoutes.login,
     getPages: AppPages.pages,
     home: const LoginPage(),

     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



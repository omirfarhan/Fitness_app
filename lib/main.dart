import 'package:cleancodearchitecture/core/routes/app_routes.dart';
import 'package:cleancodearchitecture/features/auth/presentation/binding/auth_binding.dart';
import 'package:cleancodearchitecture/features/auth/presentation/getx/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthService());
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
     initialRoute:  AppRoutes.login,
     getPages: AppPages.pages,
     //home: const LoginPage(),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



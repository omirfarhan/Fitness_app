import 'package:cleancodearchitecture/features/auth/presentation/binding/auth_binding.dart';
import 'package:cleancodearchitecture/features/auth/presentation/pages/home_page.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/registration_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: AuthBinding()
    ),

    GetPage(
        name: AppRoutes.register,
        page: () => RegistrationPage(),
        binding: AuthBinding()
    ),

    //Home Page
    GetPage(
        name: AppRoutes.homescreen,
        page: () =>const HomePage(),
        binding: AuthBinding()
    ),

  ];


}
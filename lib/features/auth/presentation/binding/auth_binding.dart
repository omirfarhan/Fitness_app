import 'package:cleancodearchitecture/core/network/api_client.dart';
import 'package:get/get.dart';

import '../getx/authcontroller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authcontroller>(() => Authcontroller());
    Get.lazyPut<ApiClient>(() => ApiClient());
  }

}
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService{

  final box = GetStorage();
  bool get isLoggedIn => box.read('isLoggedIn') ?? false;
  bool get isLoggedOut => box.read('isLoggedOut') ?? false;

}
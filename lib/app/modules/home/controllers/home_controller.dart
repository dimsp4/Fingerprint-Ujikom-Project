import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final LocalAuthentication auth = LocalAuthentication();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

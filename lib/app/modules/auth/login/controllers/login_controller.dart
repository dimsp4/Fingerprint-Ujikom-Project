import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

  void visibleText() {
    obscureText = !obscureText;
    update();
  }
}
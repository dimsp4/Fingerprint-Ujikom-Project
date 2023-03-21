import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeGuruController extends GetxController {
  //TODO: Implement HomeGuruController

  final count = 0.obs;
  final LocalAuthentication auth = LocalAuthentication();
  final List<Widget> listSchedule = [];
  late int indexSchedule;

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

  List<Widget> schedule(int index) {
    indexSchedule = index;
    return listSchedule;
  }
}

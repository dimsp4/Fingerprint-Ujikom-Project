import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeGuruController extends GetxController {
  //TODO: Implement HomeGuruController

  final count = 0.obs;
  final LocalAuthentication auth = LocalAuthentication();

  late int indexSchedule;
  late QuerySnapshot snap;

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

  void scheduleFire() async {
    snap = await FirebaseFirestore.instance.collection('Guru').get();
  }
}

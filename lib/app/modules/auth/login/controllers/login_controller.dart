import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool loading = false;
  bool auth = false;
  int page = 0;
  int toggleValue = 0;
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

  void toggleSwitch(int value) {
    toggleValue = value;
    update();
  }

  Future<void> validatingAuth(BuildContext context) async {
    loading = true;
    auth = false;
    update();
    print("loading true");

    FocusScope.of(context).unfocus();
    String id = idController.text;
    String pass = passController.text;

    if (formKey.currentState!.validate()) {
      dynamic snap;
      print(toggleValue);

      if (toggleValue == 0) {
        snap = await FirebaseFirestore.instance
            .collection('Guru')
            .where('id', isEqualTo: id)
            .get();
      } else {
        snap = await FirebaseFirestore.instance
            .collection('Siswa')
            .where('id', isEqualTo: id)
            .get();
      }

      try {
        if (id == snap.docs[0]['id'] && pass == snap.docs[0]['password']) {
          //BERHASIL-----
          if (toggleValue == 0) {
            page = 0;
            auth = true;
          } else {
            page = 1;
            auth = true;
          }
          update();
        } else {
          // print("gagal");
        }
      } catch (e) {
        //GAGAL-----
        if (e.toString() ==
            "RangeError (index): Invalid value: Valid value range is empty: 0") {
          Get.defaultDialog(
            middleText: "Email or Password are incorrect.",
            titlePadding: const EdgeInsets.only(
              top: 20,
            ),
          );
        }
      }
    } else {
      //GAGAL-----
      print("gagal");
    }

    print("loading false");
    loading = false;
    update();
  }
}

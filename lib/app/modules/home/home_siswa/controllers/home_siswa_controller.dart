import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:intl/intl.dart';

import 'package:local_auth/error_codes.dart' as auth_error;

class HomeSiswaController extends GetxController {
  //TODO: Implement HomeSiswaController

  final kodeController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  var valueGuru;
  var valueSiswa;
  var resultColor = Colors.white;
  var resultText = "";
  int indexes = 0;

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

  Future authenticate() async {
    final bool isBiometricsAvailable = await auth.isDeviceSupported();

    if (!isBiometricsAvailable) return false;

    try {
      return await auth.authenticate(
        localizedReason: 'Scan Fingerprint To Enter Vault',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException {
      return;
    }
  }

  void fingerAuth() async {
    valueGuru =
        await FirebaseFirestore.instance.collection('Guru').doc('test').get();

    valueSiswa =
        await FirebaseFirestore.instance.collection('Siswa').doc('akun').get();

    var kelas = valueGuru.get('classes')[kodeController.text];
    var historySiswa = valueSiswa.get('history')[kodeController.text];

    if (kelas != null) {
      bool isAuthenticated = await authenticate();

      if (isAuthenticated) {
        try {
          await FirebaseFirestore.instance.collection('Siswa').doc('akun').set(
            {
              "history": {
                kodeController.text: {
                  'date': DateFormat().add_yMMMd().format(DateTime.now()),
                  'time': DateFormat("hh:mm a").format(DateTime.now()),
                  'kelas': kelas['kelas'],
                  'schedule': kelas['schedule'],
                  'kode': kodeController.text,
                },
              },
            },
            SetOptions(
              merge: true,
            ),
          );
        } catch (e) {
          print(e);
        }

        update();

        try {
          await FirebaseFirestore.instance.collection('Guru').doc('test').set(
            {
              "classes": {
                kodeController.text: {
                  'student': {
                    valueSiswa['name']: {
                      'name': valueSiswa['name'],
                      'kelas': valueSiswa['kelas'],
                      'date': DateFormat().add_yMMMd().format(DateTime.now()),
                      'time': DateFormat("hh:mm a").format(DateTime.now()),
                    }
                  }
                },
              },
            },
            SetOptions(
              merge: true,
            ),
          );
        } catch (e) {
          print(e);
        }
      } else {
        print("gagal terotentikasi");
      }
    } else {
      Get.defaultDialog(
        middleText: "Code class not found",
        titlePadding: const EdgeInsets.only(
          top: 20,
        ),
      );
    }
  }

  void sendDataStudent(int index) {
    valueSiswa.data()!['classes'][
        (valueSiswa.data()!['classes'] as Map<String, dynamic>)
            .keys
            .toList()[index]]['student'];
  }
}

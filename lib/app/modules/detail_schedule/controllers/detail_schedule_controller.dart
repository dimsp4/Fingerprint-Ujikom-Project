import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailScheduleController extends GetxController {
  //TODO: Implement DetailScheduleController

  final List<String> items = [
    'Izin',
    'Alpha',
    'Sakit',
  ];
  String? selectedValue;
  TextEditingController controllerSiswa = TextEditingController();

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

  void selected(String value) {
    selectedValue = value;
    update();
  }

  Future addStudent(String kode) async {
    try {
      await FirebaseFirestore.instance.collection('Guru').doc('test').set(
        {
          "classes": {
            kode: {
              'student': {
                controllerSiswa.text: {
                  'name': controllerSiswa.text,
                  'date': DateFormat().add_yMMMd().format(DateTime.now()),
                  'time': DateFormat("hh:mm a").format(DateTime.now()),
                  'status': selectedValue,
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
    Get.back();
    update();
  }

  MaterialColor statusColor(String status) {
    switch (status) {
      case 'Hadir':
        return Colors.green;
      case 'Izin':
        return Colors.yellow;
      case 'Sakit':
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }

  String statusText(String status, String time) {
    switch (status) {
      case 'Hadir':
        return time;
      case 'Izin':
        return "Permissed";
      case 'Sakit':
        return "Sick";
      default:
        return "Alpha";
    }
  }

  Future deleteSchedule(String kode) async {
    await FirebaseFirestore.instance.collection('Guru').doc('test').set(
      {
        "classes": {
          kode: FieldValue.delete(),
        },
      },
      SetOptions(
        merge: true,
      ),
    );
  }
}

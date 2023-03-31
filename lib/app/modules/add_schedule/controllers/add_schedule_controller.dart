import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprint_test2/app/data/partials/schedule_tile.dart';
import 'package:fingerprint_test2/app/modules/home/home_guru/controllers/home_guru_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddScheduleController extends GetxController {
  //TODO: Implement AddScheduleController

  final count = 0.obs;
  var dateController = TextEditingController(
      text: DateFormat().add_yMMMd().format(DateTime.now()));
  final List<Widget> listSchedule = [];
  final classController = TextEditingController();
  final schedController = TextEditingController();
  final kodeController = TextEditingController();
  int length = 0;
  var snap;

  // var listC = Get.put(HomeGuruController());

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

  void clearData() {
    dateController.text = "";
    classController.text = "";
    schedController.text = "";
    kodeController.text = "";
  }

  Future addSchedule() async {
    await FirebaseFirestore.instance.collection('Guru').doc('test').set(
      {
        "classes": {
          kodeController.text: {
            'date': dateController.text,
            'kelas': classController.text,
            'schedule': schedController.text,
            'code': kodeController.text,
            'student': {}
          },
        },
      },
      SetOptions(
        merge: true,
      ),
    );

    snap = await FirebaseFirestore.instance.collection('Guru').get();

    length = (snap.docs.single.data()['classes'] as Map<String, dynamic>)
        .keys
        .toList()
        .length;

    listSchedule.add(
      ScheduleTile(
        date: dateController.text == ""
            ? DateFormat().add_yMMMd().format(DateTime.now())
            : dateController.text,
        kelas: classController.text,
        scheduleName: schedController.text,
      ),
    );

    clearData();
    update();
  }
}

import 'package:fingerprint_test2/app/modules/add_schedule/controllers/add_schedule_controller.dart';
import 'package:fingerprint_test2/app/modules/home/home_guru/controllers/home_guru_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_schedule_controller.dart';

class DetailScheduleView extends GetView<DetailScheduleController> {
  const DetailScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var scheduleC = Get.put(HomeGuruController());
    var addC = Get.put(AddScheduleController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailScheduleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

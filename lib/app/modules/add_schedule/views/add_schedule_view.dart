import 'package:fingerprint_test2/app/data/partials/date_pick_field.dart';
import 'package:fingerprint_test2/app/data/partials/titled_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_schedule_controller.dart';

class AddScheduleView extends GetView<AddScheduleController> {
  const AddScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Add Schedule'),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickField(controller: controller.dateController),
            TitledTextField(
              controller: controller.schedController,
              name: 'Schedule',
              hint: 'Name your schedule...',
            ),
            TitledTextField(
              controller: controller.classController,
              name: "Class",
              hint: "Name your class...",
            ),
            TitledTextField(
              controller: controller.kodeController,
              name: "Code Class",
              hint: "Make your code...",
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          await controller.addSchedule();
          Get.back();
        },
        child: Container(
          color: const Color(0xFF005EC2),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              height: 60,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

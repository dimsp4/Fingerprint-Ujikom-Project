import 'package:fingerprint_test2/app/data/partials/bottom_nav_custom.dart';
import 'package:fingerprint_test2/app/modules/add_schedule/controllers/add_schedule_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_guru_controller.dart';

class HomeGuruView extends GetView<HomeGuruController> {
  const HomeGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var addC = Get.put(AddScheduleController());

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Text(
                      "Hi,\nFulan",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 40),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Your Schedule",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: GetBuilder(
                            init: addC,
                            builder: ((_) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: controller.listSchedule.length,
                                itemBuilder: ((context, index) {
                                  if (controller.listSchedule.isEmpty) {
                                    return Text(
                                      "No schedule",
                                      style: TextStyle(color: Colors.black),
                                    );
                                  } else {
                                    return controller.schedule(index)[index];
                                  }
                                }),
                              );
                            })),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              minimum: EdgeInsets.only(
                bottom: 50,
              ),
              child: BottomNavCustom(),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavCustom(),
    );
  }
}

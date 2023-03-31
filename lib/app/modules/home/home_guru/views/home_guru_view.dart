import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprint_test2/app/data/partials/bottom_nav_custom.dart';
import 'package:fingerprint_test2/app/data/partials/schedule_tile.dart';
import 'package:fingerprint_test2/app/modules/add_schedule/controllers/add_schedule_controller.dart';
import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              SizedBox(
                height: Get.height / 3,
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                      const Text(
                        "Your Schedule",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder(
                        init: HomeGuruController(),
                        builder: ((_) {
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('Guru')
                                .doc('test')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var snapLength =
                                    (snapshot.data!.data()!['classes']
                                            as Map<String, dynamic>)
                                        .keys
                                        .toList()
                                        .length;
                                return Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: snapLength,
                                    itemBuilder: ((context, index) {
                                      ///
                                      var snap =
                                          snapshot.data!.data()!['classes'][
                                              (snapshot.data!.data()!['classes']
                                                      as Map<String, dynamic>)
                                                  .keys
                                                  .toList()[index]];

                                      ///
                                      var studentLength = (snapshot.data!
                                                  .data()!['classes'][(snapshot
                                                          .data!
                                                          .data()!['classes']
                                                      as Map<String, dynamic>)
                                                  .keys
                                                  .toList()[index]]['student']
                                              as Map<String, dynamic>)
                                          .keys
                                          .toList()
                                          .length;

                                      ///
                                      var snapStudentList =
                                          snapshot.data!.data()!['classes'][
                                              (snapshot.data!.data()!['classes']
                                                      as Map<String, dynamic>)
                                                  .keys
                                                  .toList()[index]]['student'];

                                      ///

                                      return InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.DETAIL_SCHEDULE,
                                            arguments: {
                                              'snap': snap,
                                              'schedule': snap['schedule'],
                                              'kelas': snap['kelas'],
                                              'date': snap['date'] == ""
                                                  ? DateFormat()
                                                      .add_yMMMd()
                                                      .format(DateTime.now())
                                                  : snap['date'],
                                              'kode': snap['code'],
                                              'studentLength': studentLength,
                                              'listStudent': snapStudentList,
                                            },
                                          );
                                        },
                                        child: ScheduleTile(
                                          scheduleName: snap['schedule'],
                                          kelas: snap['kelas'],
                                          date: snap['date'] == ""
                                              ? DateFormat()
                                                  .add_yMMMd()
                                                  .format(DateTime.now())
                                              : snap['date'],
                                        ),
                                      );
                                    }
                                        // }
                                        ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: BottomNavCustom(),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavCustom(),
    );
  }
}

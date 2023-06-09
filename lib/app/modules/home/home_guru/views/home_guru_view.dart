import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprint_test2/app/data/partials/bottom_nav_custom.dart';
import 'package:fingerprint_test2/app/data/partials/schedule_tile.dart';
import 'package:fingerprint_test2/app/modules/add_schedule/controllers/add_schedule_controller.dart';
import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../controllers/home_guru_controller.dart';

class HomeGuruView extends GetView<HomeGuruController> {
  const HomeGuruView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(
            child: Container(
              key: UniqueKey(),
              child: Center(
                child: CircularParticle(
                  awayRadius: 80,
                  numberOfParticles: 300,
                  speedOfParticles: 0.5,
                  height: Get.height,
                  width: Get.width,
                  onTapAnimation: true,
                  particleColor: Colors.white.withOpacity(0.2),
                  awayAnimationDuration: Duration(milliseconds: 200),
                  maxParticleSize: 3,
                  isRandSize: true,
                  isRandomColor: true,
                  randColorList: [
                    Colors.white.withOpacity(0.2),
                  ],
                  awayAnimationCurve: Curves.ease,
                  enableHover: true,
                  hoverColor: Colors.white.withOpacity(0.2),
                  hoverRadius: 100,
                  connectDots: true,
                ),
              ),
            ),
          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Schedule",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: (() async {
                              controller.update();
                            }),
                            icon: Icon(
                              Icons.refresh,
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<HomeGuruController>(
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
                                        onTap: () async {
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
                                    }),
                                  ),
                                );
                              } else {
                                return const Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
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

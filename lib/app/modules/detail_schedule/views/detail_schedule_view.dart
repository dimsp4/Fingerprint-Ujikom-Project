import 'package:fingerprint_test2/app/data/partials/box_info.dart';
import 'package:fingerprint_test2/app/data/partials/titled_textfield.dart';
import 'package:fingerprint_test2/app/modules/add_schedule/controllers/add_schedule_controller.dart';
import 'package:fingerprint_test2/app/modules/home/home_guru/controllers/home_guru_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_schedule_controller.dart';

class DetailScheduleView extends GetView<DetailScheduleController> {
  const DetailScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg['schedule'],
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxInfo(
                name: "Date",
                hint: arg['date'],
              ),
              BoxInfo(
                name: "Schedule",
                hint: arg['schedule'],
              ),
              BoxInfo(
                name: "Class",
                hint: arg['kelas'],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 2.5),
                ),
                child: Center(
                  child: Text(
                    "CODE : ${arg['kode']}",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Student Attendant',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: arg['studentLength'] != 0
                    ? ListView.builder(
                        itemCount: arg['studentLength'],
                        itemBuilder: ((context, index) {
                          var nameStudent = arg['listStudent'][
                              (arg['listStudent'] as Map<String, dynamic>)
                                  .keys
                                  .toList()[index]]['name'];

                          var timeStudent = arg['listStudent'][
                              (arg['listStudent'] as Map<String, dynamic>)
                                  .keys
                                  .toList()[index]]['time'];

                          return Card(
                            margin: EdgeInsets.only(bottom: 20),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              title: Text(
                                nameStudent,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                              // subtitle: Text.rich(
                              //   TextSpan(
                              //     children: [
                              //       TextSpan(
                              //         text: arg['snapStudent']['time'],
                              //         style: TextStyle(
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              trailing: Text(timeStudent),
                              minVerticalPadding: 20,
                            ),
                          );
                        }),
                      )
                    : Center(
                        child: Text(
                        "No Student",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black26),
                      )),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (() {}),
                        child: Text(
                          "Edit",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (() {}),
                        child: Text(
                          "Delete",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.blue, width: 1.5),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

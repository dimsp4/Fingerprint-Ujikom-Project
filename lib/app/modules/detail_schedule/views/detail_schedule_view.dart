import 'package:dropdown_button2/dropdown_button2.dart';
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
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Student Attendant',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: (() {
                    Get.defaultDialog(
                      titlePadding: EdgeInsets.only(
                        top: 30,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      confirmTextColor: Colors.white,
                      title: "Add Student",
                      onConfirm: () {
                        controller.addStudent(arg['kode']);
                      },
                      onCancel: () {},
                      content: Column(
                        children: [
                          TextField(
                            controller: controller.controllerSiswa,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                              ),
                              hintText: 'Student Name',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropDownCostum(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
                  icon: Icon(
                    Icons.add_box_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: arg['studentLength'] != 0
                  ? ListView.builder(
                      itemCount: arg['studentLength'],
                      itemBuilder: ((context, index) {
                        var student = arg['listStudent'][
                            (arg['listStudent'] as Map<String, dynamic>)
                                .keys
                                .toList()[index]];

                        // var nameStudent = arg['listStudent'][
                        //     (arg['listStudent'] as Map<String, dynamic>)
                        //         .keys
                        //         .toList()[index]]['name'];

                        // var timeStudent = arg['listStudent'][
                        //     (arg['listStudent'] as Map<String, dynamic>)
                        //         .keys
                        //         .toList()[index]]['time'];

                        return Card(
                          margin: EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              color: controller.statusColor(student['status']),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            title: Text(
                              student['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            trailing: Text(
                              controller.statusText(
                                student['status'],
                                student['time'],
                              ),
                            ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: (() {}),
                  //     child: Text(
                  //       "Edit",
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  SizedBox(
                    width: Get.width / 2.5,
                    child: ElevatedButton(
                      onPressed: (() async {
                        await Get.defaultDialog(
                          title: "Delete Schedule",
                          middleText: "Are you sure want to delete?",
                          titlePadding: const EdgeInsets.only(
                            top: 20,
                          ),
                          textConfirm: "Yes",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          confirmTextColor: Colors.white,
                          onConfirm: () async {
                            await controller.deleteSchedule(arg['kode']);
                            Get.put(HomeGuruController()).update();
                            Get.back();
                            Get.back();
                          },
                          onCancel: () {},
                        );

                        // print()
                      }),
                      child: Text(
                        "Delete Schedule",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shadowColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          Colors.red[900],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownCostum extends StatelessWidget {
  const DropDownCostum({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailScheduleController>(
      builder: ((controller) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    controller.selectedValue ?? 'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: controller.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: controller.selectedValue,
            onChanged: (value) {
              controller.selected(value as String);
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              // width: Get.width,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.blue,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              // iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blue,
              ),
              elevation: 8,
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        );
      }),
    );
  }
}

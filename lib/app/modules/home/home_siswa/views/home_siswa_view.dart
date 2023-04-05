import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprint_test2/app/modules/home/home_siswa/views/fingerprint_page.dart';
import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaView extends GetView<HomeSiswaController> {
  HomeSiswaView({Key? key}) : super(key: key);
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeSiswaView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Code',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: 55,
                    child: TextField(
                      controller: controller.kodeController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Type your class code...",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      child: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () async {
                        controller.fingerAuth(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<HomeSiswaController>(
              init: HomeSiswaController(),
              builder: ((_) {
                return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Siswa')
                      .doc('akun')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var snapLength = (snapshot.data!.data()!['history']
                              as Map<String, dynamic>)
                          .keys
                          .toList()
                          .length;

                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: snapLength,
                          shrinkWrap: false,
                          itemBuilder: ((context, index) {
                            ///
                            var snap = snapshot.data!.data()!['history'][
                                (snapshot.data!.data()!['history']
                                        as Map<String, dynamic>)
                                    .keys
                                    .toList()[index]];

                            ///
                            return Card(
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 0.5,
                                  color: Colors.black54,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  snap['schedule'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                subtitle: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${snap['kelas']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // minVerticalPadding: 30,
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snap['date'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black38),
                                    ),
                                    Text(
                                      snap['time'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          await Get.defaultDialog(
            title: "Log Out",
            middleText: "Are you sure want to logout?",
            titlePadding: const EdgeInsets.only(
              top: 20,
            ),
            textConfirm: "Yes",
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            confirmTextColor: Colors.white,
            onConfirm: () => Get.offAllNamed(Routes.SPLASH),
            onCancel: () => Get.back(),
          );
        },
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}

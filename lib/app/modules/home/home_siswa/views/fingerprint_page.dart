import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                  size: Get.width / 2.5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please put finger on your fingerprint",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            right: 30,
            left: 30,
            bottom: Get.width / 5,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: (() {
                  Get.back();
                }),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                style: ButtonStyle(
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
          ),
        ],
      ),
    );
  }
}

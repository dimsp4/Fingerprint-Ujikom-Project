import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavCustom extends StatelessWidget {
  BottomNavCustom({Key? key}) : super(key: key);

  final primaryColor = Colors.blueGrey;
  final secondaryColor = Colors.lightBlue;
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF005EC2),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 60,
      width: Get.width / 1.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconBottomBar(
                icon: Icons.add,
                onPressed: () {
                  Get.toNamed(Routes.ADD_SCHEDULE);
                }),
            IconBottomBar(
                icon: Icons.logout,
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
                }),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 25, color: accentColor),
        ),
      ],
    );
  }
}

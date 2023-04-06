import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double heightScreen = Get.height;
    double widthScreen = Get.width;

    return Scaffold(
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
                  height: heightScreen,
                  width: widthScreen,
                  onTapAnimation: true,
                  particleColor: Colors.blue.withOpacity(0.2),
                  awayAnimationDuration: Duration(milliseconds: 200),
                  maxParticleSize: 3,
                  isRandSize: true,
                  isRandomColor: true,
                  randColorList: [
                    Colors.blue.withOpacity(0.2),
                  ],
                  awayAnimationCurve: Curves.ease,
                  enableHover: true,
                  hoverColor: Colors.blue.withOpacity(0.2),
                  hoverRadius: 100,
                  connectDots: true,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/idn-logo.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  "Attendance App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Make your attendance\nbetter and safer",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 300,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed(Routes.REGISTER);
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 300,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

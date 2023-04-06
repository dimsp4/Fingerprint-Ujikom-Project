import 'package:fingerprint_test2/app/modules/auth/login/controllers/login_controller.dart';
import 'package:fingerprint_test2/app/modules/splash/controllers/splash_controller.dart';
import 'package:fingerprint_test2/app/modules/splash/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()).initialization();
    return GetBuilder(
      init: LoginController(),
      builder: ((controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ),
        );
      }),
    );
  }
}

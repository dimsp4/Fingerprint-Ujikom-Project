import 'package:get/get.dart';

import '../modules/add_schedule/bindings/add_schedule_binding.dart';
import '../modules/add_schedule/views/add_schedule_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/detail_schedule/bindings/detail_schedule_binding.dart';
import '../modules/detail_schedule/views/detail_schedule_view.dart';
import '../modules/home/home_guru/bindings/home_guru_binding.dart';
import '../modules/home/home_guru/views/home_guru_view.dart';
import '../modules/home/home_siswa/bindings/home_siswa_binding.dart';
import '../modules/home/home_siswa/views/home_siswa_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SCHEDULE,
      page: () => const AddScheduleView(),
      binding: AddScheduleBinding(),
    ),
    GetPage(
      name: _Paths.HOME_GURU,
      page: () => const HomeGuruView(),
      binding: HomeGuruBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SISWA,
      page: () => const HomeSiswaView(),
      binding: HomeSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SCHEDULE,
      page: () => const DetailScheduleView(),
      binding: DetailScheduleBinding(),
    ),
  ];
}

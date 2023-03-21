import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaView extends GetView<HomeSiswaController> {
  const HomeSiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeSiswaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

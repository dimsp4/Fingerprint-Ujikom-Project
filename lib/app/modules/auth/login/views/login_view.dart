import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.idController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                    ),
                    hintText: 'ID',
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "* Required"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<LoginController>(
                  builder: ((controller) {
                    return TextFormField(
                      controller: controller.passController,
                      obscureText: controller.obscureText,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.visibleText();
                          },
                          child: Icon(
                            controller.obscureText == false
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.black54,
                          ),
                        ),
                        hintText: 'Password',
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "* Required",
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      String id = controller.idController.text;
                      String pass = controller.passController.text;

                      if (controller.formKey.currentState!.validate()) {
                        QuerySnapshot snap = await FirebaseFirestore.instance
                            .collection('Guru')
                            .where('id', isEqualTo: id)
                            .get();

                        print(snap.docs[0]['id']);
                      } else {
                        print("gagal");
                      }
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      // width: 300,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New User?'),
                      TextButton(
                          onPressed: (() {
                            Get.offAllNamed(Routes.REGISTER);
                          }),
                          child: const Text("Create Account"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

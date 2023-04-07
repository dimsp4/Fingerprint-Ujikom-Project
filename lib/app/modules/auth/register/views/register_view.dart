import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:fingerprint_test2/app/data/partials/animation_toggle.dart';
import 'package:fingerprint_test2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: "Press back again to close",
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AnimatedToggle(
                      values: ['Guru', 'Siswa'],
                      onToggleCallback: (value) {
                        // controller.toggleSwitch(value);
                      },
                      buttonColor: Colors.blueAccent,
                      backgroundColor: Colors.black12,
                      textColor: const Color(0xFFFFFFFF),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outlined,
                        ),
                        hintText: 'Username',
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "* Required"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        hintText: 'Email',
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<RegisterController>(
                      builder: ((controller) {
                        return TextFormField(
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
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText:
                                      "Password should be atleast 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                      "Password should not be greater than 15 characters"),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<RegisterController>(
                      builder: ((controller) {
                        return TextFormField(
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
                            hintText: 'Enter Password Again',
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText:
                                      "Password should be atleast 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                      "Password should not be greater than 15 characters"),
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
                        onTap: () {
                          // Get.toNamed(Routes.LOGIN);
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          // width: 300,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Joined us before?'),
                          TextButton(
                              onPressed: (() {
                                Get.offAllNamed(Routes.LOGIN);
                              }),
                              child: const Text("Login"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

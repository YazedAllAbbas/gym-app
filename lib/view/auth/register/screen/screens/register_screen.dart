import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    
      final RegisterController controller = Get.find();
    return GetBuilder<RegisterController>(
        //  init: RegisterController(),
        builder: (controller) => Form(
              key: controller.registerFormKey,
              child: Scaffold(
                  body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // IconButton(
                            //   icon: Image.asset('assets/images/shape.png'),
                            //   onPressed: () {
                            //     Get.back();
                            //   },
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.3,
                        ),
                        // Image.asset(
                        //   'assets/images/Frame 190.png',
                        //   height: 100,
                        // ),
                        Text(
                          "Create your account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SourceSerif4",
                          //  fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.18,
                        ),
                        CustomFormTextField(
                          hintText: 'Email',
                          myController: controller.emailController,
                          myValid: controller.validGlobal,
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        //   CustomFormTextField(
                        //   hintText: 'userName',
                        //   myController: controller.usernameController,
                        //   myValid: controller.validUsername,
                        // ),
                        // SizedBox(
                        //   height: media.width * 0.04,
                        // ),
                        CustomFormTextField(
                          hintText: 'First Name',
                          myController: controller.firstnameController,
                          myValid: controller.validUsername,
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        CustomFormTextField(
                          hintText: 'Last Name',
                          myController: controller.lastnameController,
                          myValid: controller.validUsername,
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        CustomFormTextField(
                          hintText: 'Password',
                          myController: controller.passwordController,
                          myValid: controller.validPassword,
                        ),
                        // SizedBox(
                        //   height: media.width * 0.04,
                        // ),
                        // CustomFormTextField(
                        //   hintText: 'confirm Password',
                        //   myController: controller.confirmPasswordController,
                        //   myValid: controller.validConfirmPassword,
                        // ),
                        SizedBox(
                          height: media.width * 0.12,
                        ),
                        CustomButton(
                          text: 'Next',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            // Get.offNamed('/secondScreen');
                            //  controller.register();
                            controller.generateUsername();
                            if (controller.registerFormKey.currentState!
                                .validate()) {
                              Get.toNamed('/phoneScreen');
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Cairo",
                                    fontSize: 14),
                              ),
                              // const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed('/loginScreen');
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: AppColor.grey,
                                      fontFamily: "Poppins",
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ));
  }
}

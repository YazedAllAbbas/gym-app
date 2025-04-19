import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/auth/login/controller/login_controller.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_botton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final LoginController loginController = Get.put(LoginController());
    return GetBuilder<LoginController>(
        builder: (controller) => Form(
              key: controller.formKey,
              child: Scaffold(
                  body: Stack(
                children: [
                  SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: media.width * 0.3,
                            ),
                            const Text('Welcome Back',
                                style: TextStyle(
                                  color: Colors.black, fontSize: 32,
                                  fontFamily: "SourceSerif4",
                                  //  fontWeight: FontWeight.bold,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: media.width * 0.18,
                            ),
                            CustomFormTextField(
                              hintText: 'username',
                              myController: controller.usernameController,
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
                            //   height: 40,
                            // ),
                            SizedBox(
                              height: media.width * 0.35,
                            ),
                            CustomButton(
                              text: 'Login',
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.login();
                              },
                            ),
                            const SizedBox(height: 10),
                            const Center(
                                child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  color: AppColor.grey,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )),
                            const SizedBox(height: 50),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don’t have an account yet? ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Cairo",
                                        fontSize: 14),
                                  ),
                                  // const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offNamed('/registerScreen');
                                    },
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                          color: AppColor.grey,
                                          fontFamily: "Poppins",
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: media.width * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (controller.isLoading)
                    const CircularProgressIndicatorCustom(),
                ],
              )),
            ));
  }
}

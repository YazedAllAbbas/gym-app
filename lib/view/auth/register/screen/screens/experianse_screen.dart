import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExperianseScreen extends StatelessWidget {
  const ExperianseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final RegisterController controller = Get.find();
    return GetBuilder<RegisterController>(
        builder: (controller) => Scaffold(
                body: Stack(children: [
              SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.2,
                        ),
                        Text("What is your fitness level?",
                            style: TextStyle(
                                fontSize: 22,
                                // fontWeight: FontWeight.bold,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SourceSerif4')),
                        SizedBox(
                          height: media.width * 0.18,
                        ),
                        Container(
                          height: media.height * 0.32,
                          child: ListView.builder(
                            itemCount: controller.experianse_level.length,
                            itemBuilder: (context, index) {
                              final experianse_Level =
                                  controller.experianse_level[index];
                              final isSelected =
                                  controller.experianseLevelIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  controller.experianseLevel(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColor.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColor.primaryColor2
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    experianse_Level,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.3,
                        ),
                        CustomButton(
                          text: 'Register',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            // Get.offNamed('/secondScreen');
                            //  controller.register();

                            controller.register();
                            //  Get.toNamed('/secondScreen');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.isLoading) const CircularProgressIndicatorCustom(),
            ])));
  }
}

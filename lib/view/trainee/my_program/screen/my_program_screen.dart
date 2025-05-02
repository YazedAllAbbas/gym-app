import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/controller/build_program_controller.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyProgramScreen extends StatelessWidget {
  const MyProgramScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final MyProgramController controller = Get.put(MyProgramController());

    return GetBuilder<MyProgramController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Program",
            style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "SourceSerif4",
                shadows: [
                  Shadow(
                      color: Colors.black26,
                      blurRadius: 0.2,
                      offset: Offset(1, 2))
                ]),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/workoutProgram');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 55),
                    decoration: BoxDecoration(
                      // color: Color(0xFF82B1FF),
                      // color: Color(0xffFFEC8B),
                      // color: Color(0xffB5E1FA),
                      // color: Color(0xffB6F075),
                      // color: Color(0xFF80D8FF),
                      // color: Color(0xFFFFF59D),
                   color: Color(0xFFD6EDFF),
// color: AppColor.primaryColor2,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // ظل خفيف
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.fitness_center,
                            color: Colors.black,size: 30,), // أيقونة
                        SizedBox(width: 8),
                        Text(
                          "Workout Program",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SourceSerif4",
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 3,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/nutritionProgram');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                //    padding: const EdgeInsets.symmetric(vertical: 16),
                       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 55), //
                    decoration: BoxDecoration(
                    //  color: Color(0xFFDFFFD6),
                  // color:  AppColor.secondaryColor2,
                  color:      Color(0xFFD1D9FF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // ظل خفيف
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.local_dining,
                            color: Colors.black,size: 
                            30,),
                        // SizedBox(width: 30),
                        Text(
                          "Nutrition Program",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SourceSerif4",
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 3,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:final_project/models/exersice_model/exersice_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffEFF3F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        title: Text(
          exercise.name,
          style: TextStyle(
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            // color: AppColor.primaryColor,
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.r),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w),
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                      child: Image.asset(
                        "assets/images/Pectoralis.png",
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.play_circle_outline_sharp,
                    color: Colors.blueGrey,
                    size: 72.r,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    exercise.muscleGroup,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: "SourceSerif4",
                      // color: AppColor.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppColor.primaryColor,
                        size: 32.r,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: AppColor.primaryColor,
                        size: 30.r,
                      )),
                ],
              ),
              Text(
                exercise.machine == null ? "Cable Machine" : exercise.machine!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: "SourceSerif4",
                  color: AppColor.primaryColor,
                ),
              ),
              const Divider(),
              SizedBox(
                height: screenHeight / 80,
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(width: 0.1.sp, color: AppColor.primaryColor),
                  color: Colors.transparent.withOpacity(0.1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 0,
                        color: Colors.white,
                        offset: Offset(0, 0))
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "SourceSerif4",
                          ),
                        ),
                        Text(
                          "sets",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w200,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth / 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "x",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: "SourceSerif4",
                            // color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w100,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth / 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "SourceSerif4",
                            // color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "reps",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w200,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight / 50,
              ),
              Text(
                exercise.description,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: "SourceSerif4",
                  // height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

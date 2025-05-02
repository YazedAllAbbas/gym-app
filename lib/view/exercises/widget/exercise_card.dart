import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/exersice_model/exersice_model.dart';

import 'package:final_project/view/exercises/exercises_screen/exercise_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 2.2),
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 7.r),
      child: ListTile(
        onTap: () => Get.to(ExerciseDetailsScreen(
          exercise: exercise,
        )),
        title: isPortrait
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                      fontSize: 19.sp,
                      fontFamily: "SourceSerif4",
                    ),
                  ),
                  Text(
                    exercise.muscleGroup,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor,
                      fontSize: 17.sp,
                      fontFamily: "SourceSerif4",
                    ),
                  ),
                ],
              )
            : Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: exercise.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[800],
                        fontSize: 11.sp,
                        fontFamily: "SourceSerif4",
                      ),
                    ),
                    TextSpan(
                      text: '  /  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 11.sp,
                        fontFamily: "SourceSerif4",
                      ),
                    ),
                    TextSpan(
                      text: exercise.muscleGroup,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryColor,
                        fontSize: 10.sp,
                        fontFamily: "SourceSerif4",
                      ),
                    ),
                  ],
                ),
              ),
        trailing: Icon(
          Icons.navigate_next_rounded,
          size: isPortrait ? 20.r : 32.r,
        ),
      ),
    );
  }
}

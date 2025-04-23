import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/exersice_model/exersice_model.dart';

import 'package:final_project/view/exercises/exercises_screen/exercise_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEFF3F2).withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3.5,
            color: AppColor.primaryColor,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      child: ListTile(
        onTap: () => Get.to(ExerciseDetailsScreen(
          exercise: exercise,
        )),
        title: Text(
          exercise.name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
            fontSize: 19,
            fontFamily: "SourceSerif4",
          ),
        ),
        subtitle: Text(
          exercise.muscleGroup,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor,
            fontSize: 17,
            fontFamily: "SourceSerif4",
          ),
        ),
        trailing: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}

import "package:final_project/core/const_data/app_colors.dart";
import "package:final_project/view/exercises/controller/exercises_controller.dart";
import "package:final_project/view/exercises/widget/exercise_card.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ExercisesByMuscleScreen extends StatelessWidget {
  final String muscleName;
  // ignore: use_key_in_widget_constructors
  const ExercisesByMuscleScreen({required this.muscleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        title: Text(
          muscleName,
          style: const TextStyle(
            fontSize: 27,
            // color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 0.2,
                offset: Offset(1, 2),
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<ExercisesController>(
        builder: (cont) {
          if (cont.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cont.exercisesByMuscle.isEmpty) {
            return const Center(child: Text("No exercises available."));
          }

          return ListView.builder(
            itemCount: cont.exercisesByMuscle.length,
            itemBuilder: (context, index) =>
                ExerciseCard(exercise: cont.exercisesByMuscle[index]),
          );
        },
      ),
    );
  }
}

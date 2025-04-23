import 'package:final_project/view/exercises/controller/exercises_controller.dart';
import 'package:final_project/view/exercises/exercises_screen/exercies_by_muscle_screen.dart';
import 'package:final_project/view/exercises/widget/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/exercises/static/static_muscle_section_data/static_muscle_section_data.dart';
import 'package:final_project/view/exercises/widget/muscle_section_card.dart';
import 'package:final_project/view/home/drawer/drawer_screen.dart';

class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({super.key});

  final ExercisesController controller = Get.put(ExercisesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        title: const Text(
          "Exercises",
          style: TextStyle(
            fontSize: 30,
            color: AppColor.primaryColor,
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
        centerTitle: true,
        actions: const [
          SizedBox(width: 8),
          Icon(Icons.notifications_active_outlined,
              color: AppColor.primaryColor, size: 28),
          SizedBox(width: 10),
          Icon(Icons.favorite, color: AppColor.primaryColor, size: 28),
          SizedBox(width: 12),
        ],
      ),
      drawer: DrawerScreen(),
      body: RefreshIndicator(
        onRefresh: () async {
          if (controller.showAll) {
            await controller.onRefreshsExercises();
          }
        },
        child: GetBuilder<ExercisesController>(
          builder: (controller) {
            final filteredExercises = controller.exercises
                .where(
                  (exercise) =>
                      exercise.name
                          .toLowerCase()
                          .contains(controller.searchQuery.toLowerCase()) ||
                      exercise.muscleGroup
                          .toLowerCase()
                          .contains(controller.searchQuery.toLowerCase()),
                )
                .toList();

            final filteredMuscles = controller.searchQuery.isEmpty
                ? StaticMuscleSectionData.allMuscleSection
                : StaticMuscleSectionData.allMuscleSection
                    .where(
                      (muscle) => muscle.muscleName
                          .toLowerCase()
                          .contains(controller.searchQuery.toLowerCase()),
                    )
                    .toList();

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) => controller.setSearchQuery(value),
                    decoration: InputDecoration(
                      hintText: "Search for an exercise...",
                      hintStyle: const TextStyle(fontFamily: "SourceSerif4"),
                      prefixIcon: const Icon(Icons.search,
                          color: AppColor.primaryColor),
                      filled: true,
                      fillColor: AppColor.primaryColor.withOpacity(0.05),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: AppColor.primaryColor.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: AppColor.primaryColor, width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => controller.toggleView(true),
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: controller.showAll
                                ? AppColor.primaryColor
                                : Colors.grey.shade300,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: controller.showAll
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: "SourceSerif4",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => controller.toggleView(false),
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: !controller.showAll
                                ? AppColor.primaryColor
                                : Colors.grey.shade300,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "By Muscle",
                            style: TextStyle(
                              color: controller.showAll
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: "SourceSerif4",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.showAll
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: filteredExercises.length,
                              itemBuilder: (context, index) => ExerciseCard(
                                  exercise: filteredExercises[index]),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: filteredMuscles.length,
                              itemBuilder: (context, index) =>
                                  MuscleSectionCard(
                                      muscle: filteredMuscles[index],
                                      onTap: () async {
                                        final selectedMuscle =
                                            filteredMuscles[index].muscleName;
                                        Get.to(() => ExercisesByMuscleScreen(
                                            muscleName: selectedMuscle));
                                        await controller.getExercisesByMuscle(
                                            selectedMuscle);
                                        Get.to(() => ExercisesByMuscleScreen(
                                            muscleName: selectedMuscle));
                                      }),
                            ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

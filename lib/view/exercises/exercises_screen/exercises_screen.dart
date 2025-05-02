import 'package:final_project/view/exercises/controller/exercises_controller.dart';
import 'package:final_project/view/exercises/exercises_screen/exercies_by_muscle_screen.dart';
import 'package:final_project/view/exercises/widget/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        title: Text(
          "Exercises",
          style: TextStyle(
            fontSize: isPortrait ? 30.sp : 20.sp,
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            shadows: const [
              Shadow(
                color: Colors.black12,
                blurRadius: 0.2,
                offset: Offset(1, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: 8.w),
          Icon(Icons.notifications_active_outlined,
              color: AppColor.white, size: 28.r),
          SizedBox(width: 10.w),
          Icon(Icons.favorite, color: AppColor.white, size: 28.r),
          SizedBox(width: 12.w),
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
                isPortrait
                    ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(16.0.r),
                            child: TextField(
                              controller: controller.textController,
                              onChanged: (value) =>
                                  controller.setSearchQuery(value),
                              decoration: InputDecoration(
                                hintText: controller.showAll
                                    ? "Search for an exercise..."
                                    : "Search by muscle...",
                                hintStyle:
                                    const TextStyle(fontFamily: "SourceSerif4"),
                                prefixIcon: const Icon(Icons.search,
                                    color: AppColor.primaryColor),
                                filled: true,
                                fillColor:
                                    AppColor.primaryColor.withOpacity(0.05),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10.r),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.3)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor, width: 2.w),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.r),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () =>
                                        controller.toggleView(true),
                                    icon: Icon(
                                      Icons.list_alt_rounded,
                                      color: controller.showAll
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    label: Text("All",
                                        style: TextStyle(
                                          color: controller.showAll
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: isPortrait ? 16.sp : 22.sp,
                                          fontFamily: "SourceSerif4",
                                        )),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      backgroundColor: controller.showAll
                                          ? AppColor.primaryColor
                                          : Colors.grey.shade300,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth / 17),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () =>
                                        controller.toggleView(false),
                                    icon: Icon(
                                      Icons.fitness_center_rounded,
                                      color: controller.showAll
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    label: Text(
                                      "By Muscle",
                                      style: TextStyle(
                                        color: controller.showAll
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: isPortrait ? 16.sp : 22.sp,
                                        fontFamily: "SourceSerif4",
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      backgroundColor: !controller.showAll
                                          ? AppColor.primaryColor
                                          : Colors.grey.shade300,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(
                        margin: EdgeInsets.all(16.0.r),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller: controller.textController,
                                onChanged: (value) =>
                                    controller.setSearchQuery(value),
                                decoration: InputDecoration(
                                  hintText: controller.showAll
                                      ? "Search for an exercise..."
                                      : "Search by muscle...",
                                  hintStyle: const TextStyle(
                                      fontFamily: "SourceSerif4"),
                                  prefixIcon: const Icon(Icons.search,
                                      color: AppColor.primaryColor),
                                  filled: true,
                                  fillColor:
                                      AppColor.primaryColor.withOpacity(0.05),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.r),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor
                                            .withOpacity(0.3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 2.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            ElevatedButton.icon(
                              onPressed: () => controller.toggleView(true),
                              icon: const Icon(Icons.list),
                              label: const Text("All"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 14.h),
                                backgroundColor: controller.showAll
                                    ? AppColor.primaryColor
                                    : Colors.grey.shade300,
                                foregroundColor: controller.showAll
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            ElevatedButton.icon(
                              onPressed: () => controller.toggleView(false),
                              icon: const Icon(Icons.fitness_center_rounded),
                              label: const Text("By Muscle"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 14.h),
                                backgroundColor: !controller.showAll
                                    ? AppColor.primaryColor
                                    : Colors.grey.shade300,
                                foregroundColor: controller.showAll
                                    ? Colors.black
                                    : Colors.white,
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

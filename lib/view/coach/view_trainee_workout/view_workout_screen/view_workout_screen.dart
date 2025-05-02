import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/controller/build_program_controller.dart';
import 'package:final_project/view/coach/build_program/screen/build_program_screen.dart';
import 'package:final_project/view/coach/view_trainee_workout/view_workout_controller/view_workout_controller.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWorkoutScreen extends StatelessWidget {
  final UserInfoModel user;
  const ViewWorkoutScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final ViewWorkoutController controller =
        Get.put(ViewWorkoutController(user: user));

    return GetBuilder<ViewWorkoutController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "workout",
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
        body: Stack(children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.weekDays.map((day) {
                      final isSelected = controller.selectedDay == day;

                      return GestureDetector(
                        onTap: () => controller.selectDay(day),
                        child: Container(
                          width: 45,
                          padding: EdgeInsets.symmetric(vertical: 6),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              day.substring(0, 3),
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  if (controller.program != null && !controller.isLoading)
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller
                            .getExercisesByMuscleForSelectedDay()
                            .length,
                        itemBuilder: (context, index) {
                          final entries = controller
                              .getExercisesByMuscleForSelectedDay()
                              .entries
                              .toList();
                          final muscleName = entries[index].key;
                          final exercises = entries[index].value;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  muscleName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ...exercises.map((exercise) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      //  color: Colors.grey[200],
                                      color: Color(0xFFD6EDFF),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                exercise.exercise.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                  "sets: ${exercise.sets} | reps: ${exercise.reps}"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          );
                        },
                      ),
                    )
                  else
                    Center(child: Text("لا يوجد برنامج تدريبي")),
                  if (controller.program != null && !controller.isLoading)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(
                                BuildProgramScreen(user: user,isEditMode: true,
    existingProgram: controller.program,),
                              
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.white),
                            label: Text("Edit",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  //   Color(0xffFDEC92),

                                  AppColor.primaryColor,
                              //  AppColor.secondaryColor,

                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // تنفيذ الحذف
                              Get.defaultDialog(
                                title: "Delete Confirmation",
                                content: Text(
                                    "Are you sure you want to delete the program?"),
                                confirm: ElevatedButton(
                                  onPressed: () {
                                    // controller.deleteProgram(userId: user.id.toString());
                                    Get.back(); // إغلاق الحوار
                                    Get.back(); // الرجوع للخلف بعد الحذف
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.blue),
                                  child: Text("Yes"),
                                ),
                                cancel: TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    "Cancel",
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.delete, color: Colors.black),
                            label: Text("Delete",
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.lightgrey,
                              //  Colors.grey[300],
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          if (controller.isLoading) CircularProgressIndicatorCustom(),
        ]),
      ),
    );
  }
}

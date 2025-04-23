import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/controller/build_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProgramScreen extends StatelessWidget {
  final UserInfoModel user;
  const BuildProgramScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final BuildProgramController controller = Get.put(BuildProgramController());

    return GetBuilder<BuildProgramController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
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
                  // SizedBox(height: 50),
                  Text(
                    "Let's create a plan for ${user.firstName}!!",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SourceSerif4',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

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
                                :
                                //  Color(0xffFFEC8B),
                                Colors.grey[300],
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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enter the number of sets and repetitions you want to assign for this day's program:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.setsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Sets',
                            labelStyle: TextStyle(fontSize: 14),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                          onChanged: (value) {
                            final sets = int.tryParse(value) ?? 3;
                            controller.updateSets(sets);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: controller.repsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Reps',
                            labelStyle: TextStyle(fontSize: 14),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                          onChanged: (value) {
                            final reps = int.tryParse(value) ?? 10;
                            controller.updateReps(reps);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Text(
                  //   "Enter the exercises you want to assign for this day's program:",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  Text(
                    "Select exercises to include in today's plan:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // SizedBox(
                  //                   height: 10,
                  //                 ),
                  controller.isLoading
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = controller.exercises[index];
                            final isSelected = controller
                                .isExerciseSelected(exercise.exerciseId);

                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(exercise.name),
                                    content: Text(
                                        "More details about this exercise..."),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text("Close"),
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 6),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        exercise.name ?? 'No Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isSelected,
                                      onChanged: (value) {
                                        controller.toggleExerciseForDay(
                                            exercise.exerciseId);
                                      },
                                      activeColor: AppColor.primaryColor,
                                      checkColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            text: "Send Program",
            onTap: () {
              controller.makeProgram(traineeId: user.id);
            },
          ),
        ),
      ),
    );
  }
}

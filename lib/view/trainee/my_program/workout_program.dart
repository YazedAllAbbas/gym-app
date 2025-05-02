import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutProgram extends StatelessWidget {
  const WorkoutProgram({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final MyProgramController controller = Get.find();

    return GetBuilder<MyProgramController>(
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
                                      color: AppColor.blue,
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

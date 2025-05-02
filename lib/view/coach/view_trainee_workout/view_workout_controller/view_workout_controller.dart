import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/core/service/session/user_session.dart';
import 'package:final_project/models/program_model/program_model.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWorkoutController extends GetxController {
  final UserInfoModel user;
  ViewWorkoutController({required this.user});
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  ProgramModel? program;
  List<String> weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  @override
  void onInit() {
    getProgram();
  }

  String selectedDay = "Sunday";
  void selectDay(String day) {
    selectedDay = day;
    update();
  }

  Future<void> getProgram() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();

    int userId = user.id;
    var result =
        await crud().getObject('${AppLink.gettrainerprogram}/$userId/');

    result.fold(
      (failure) {
        isLoading = false;
        if (failure == StatusRequest.failure) {
          this.responceMessage = crud.message;
          Get.snackbar(
            " ",
            responceMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey[200],
            colorText: Colors.black,
            margin: EdgeInsets.all(10),
            borderRadius: 8,
            boxShadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          );
        } else if (failure == StatusRequest.offLineFailure) {
          Get.defaultDialog(
              title: "Error", middleText: "لا توجد اتصال بالإنترنت");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "Error", middleText: "حدث خطأ في الخادم");
        }
        update();
      },
      (success) {
        responce = StatusRequest.success;

        try {
          program = ProgramModel.fromJson(success);
          isLoading = false;
        } catch (e) {
          print("Error parsing program: $e");
          isLoading = false;
        }

        update();
      },
    );
  }

  Map<String, List<ExerciseElement>> getExercisesByMuscleForSelectedDay() {
    final exercisesForDay =
        program!.exercises.where((e) => e.day == selectedDay);
    final Map<String, List<ExerciseElement>> grouped = {};
    for (var exercise in exercisesForDay) {
      final muscle = exercise.exercise.muscleGroup ?? 'عضلة غير معروفة';
      if (!grouped.containsKey(muscle)) {
        grouped[muscle] = [];
      }
      grouped[muscle]!.add(exercise);
    }
    return grouped;
  }

  // @override
  // void onInit() {
  //   super.onInit();

  // }
}

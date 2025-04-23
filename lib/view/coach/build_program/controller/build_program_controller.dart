import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/models/Day_program_model/Day_program.dart';
import 'package:final_project/models/exersice_model/exersice_model.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProgramController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getExercises();
  }

  final setsController = TextEditingController();
  final repsController = TextEditingController();
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  List<ExerciseModel> exercises = [];
  List<String> weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  //Map<String, Set<int>> selectedExercisesPerDay = {};
  Map<String, DayProgram> selectedPrograms = {};
  UserInfoModel? selectedUser;
  bool isUserLoading = true;

  String selectedDay = "Sunday";
  void selectDay(String day) {
    selectedDay = day;
    selectedPrograms.putIfAbsent(
      day,
      () => DayProgram(day: day, exercises: [], sets: 0, reps: 0),
    );
    setsController.text = selectedPrograms[day]!.sets.toString();
    repsController.text = selectedPrograms[day]!.reps.toString();
    update();
  }

  Future getExercises() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();
    var result = await crud().getData(
      AppLink.getExercises,
    );
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
              title: "Error", middleText: "No internet connection");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "Error", middleText: "A server error occurred");
        }
        update();
      },
      (success) {
        responce = StatusRequest.success;

        exercises =
            success.map((item) => ExerciseModel.fromJson(item)).toList();

        isLoading = false;
        update();
      },
    );
  }

  void toggleExerciseForDay(int exerciseId) {
    final current = selectedPrograms[selectedDay];

    if (current == null) {
      selectedPrograms[selectedDay] = DayProgram(
        day: selectedDay,
        exercises: [exerciseId],
        sets: 0,
        reps: 0,
      );
    } else {
      if (current.exercises.contains(exerciseId)) {
        current.exercises.remove(exerciseId);
      } else {
        current.exercises.add(exerciseId);
      }
    }

    update();
  }

  List<Map<String, dynamic>> getProgramBody() {
    return selectedPrograms.values.map((p) => p.toJson()).toList();
  }

  bool isExerciseSelected(int exerciseId) {
    return selectedPrograms[selectedDay]?.exercises.contains(exerciseId) ??
        false;
  }

  Future<void> makeProgram({
    // required int coachId,
    required int traineeId,
    String description = "برنامج تدريب جديد",
  }) async {
    isLoading = true;
    update();
    final body = {
      "description": description,
      "days_exercises": getProgramBody(),
    };

    final UserController userController = Get.find();
    int coachId = userController.currentUser!.id;

    final url = "${AppLink.makeprogram}/$coachId/$traineeId/";

    final response = await crud().postData(url, body, {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    response.fold(
      (failure) {
        isLoading = false;
        update();
        Get.snackbar(
          "خطأ",
          "فشل في إرسال البرنامج",
          backgroundColor: Colors.red[100],
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) {
        isLoading = false;
        update();
        Get.snackbar(
          "تم بنجاح",
          "تم إرسال البرنامج بنجاح",
          backgroundColor: Colors.green[100],
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  void updateSets(int newSets) {
    if (selectedPrograms.containsKey(selectedDay)) {
      selectedPrograms[selectedDay]!.sets = newSets;

      update();
    }
  }

  void updateReps(int newReps) {
    if (selectedPrograms.containsKey(selectedDay)) {
      selectedPrograms[selectedDay]!.reps = newReps;
      update();
    }
  }
}

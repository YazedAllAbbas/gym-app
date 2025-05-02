import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/models/exersice_model/exersice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisesController extends GetxController {
  bool showAll = true;
  bool isLoading = false;
  String searchQuery = '';
  StatusRequest statusRequest = StatusRequest.loading;
  String responceMessage = '';
  List<ExerciseModel> exercises = [];
  List<ExerciseModel> exercisesByMuscle = [];
  TextEditingController textController = TextEditingController();

  void setSearchQuery(String value) {
    searchQuery = value;
    update();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void toggleView(bool value) {
    showAll = value;

    update();
  }

  @override
  void onInit() {
    getExercises();
    super.onInit();
  }

  Future onRefreshsExercises() async {
    getExercises();
  }

  Future onRefreshsexercisesByMuscle() async {
    getExercises();
  }

  Future getExercises() async {
    if (isLoading) return;
    isLoading = true;

    statusRequest = StatusRequest.loading;
    update();
    var result = await crud().getData(
      AppLink.getExercises,
    );
    result.fold(
      (failure) {
        isLoading = false;

        if (failure == StatusRequest.failure) {
          responceMessage = crud.message;
          Get.snackbar(
            " ",
            responceMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey[200],
            colorText: Colors.black,
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            boxShadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          );
        } else if (failure == StatusRequest.offLineFailure) {
          Get.defaultDialog(
              title: "Error", middleText: "No internet connection");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(
              title: "Error", middleText: "A server error occurred");
        }
        update();
      },
      (success) {
        statusRequest = StatusRequest.success;

        exercises =
            success.map((item) => ExerciseModel.fromJson(item)).toList();

        isLoading = false;
        update();
      },
    );
  }

  Future<void> getExercisesByMuscle(String muscle) async {
    isLoading = true;
    update();
    var result =
        await crud().getData("${AppLink.exercisesbymuscle}/?q=$muscle");

    result.fold(
      (failure) {
        isLoading = false;
        update();
        Get.snackbar("خطأ", "فشل في جلب التمارين");
      },
      (success) {
        exercisesByMuscle = success
            .map<ExerciseModel>((e) => ExerciseModel.fromJson(e))
            .toList();
        isLoading = false;
        update();
      },
    );
  }
}

import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTraineeController extends GetxController {
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  List<UserInfoModel> trainees = [];
  Map<String, bool> traineeProgramStatus = {};
  @override
  void onInit() {
    super.onInit();
    myTrainees();
  }

  Future myTrainees() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();

    final UserController userController = Get.find();
    String coachId = userController.currentUser!.id.toString();

    print("@@@@@@@@@@@@@@@${coachId}");
    var result =
        await crud().getData("${AppLink.traineesWithSpecificCoach}/$coachId/");
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
              title: "خطأ", middleText: "لا يوجد اتصال بالإنترنت.");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "خطأ", middleText: "حدث خطأ في الخادم.");
        }
        update();
      },
      (success) async {
        // إذا نجح الطلب
        responce = StatusRequest.success;
        // coaches = success.map((item) => Coach.fromJson(item)).toList();
        // List<dynamic> data = success;

        trainees = success.map((item) => UserInfoModel.fromJson(item)).toList();
        print(trainees);
        //  إرسال الطلبات المتوازية لحالة البرنامج لكل متدرب
        List<Future> futures = [];

        for (UserInfoModel trainee in trainees) {
          futures.add(
            crud()
                .getObject(
                    "https://mohammedmoh.pythonanywhere.com/gettrainerinfo/${trainee.id}/$coachId/")
                .then((result) {
              result.fold(
                (failure) {
                  traineeProgramStatus[trainee.id.toString()] = false;
                },
                (success) {
                  traineeProgramStatus[trainee.id.toString()] =
                      success['program_status'] ?? false;
                },
              );
            }),
          );
        }

        await Future.wait(futures);
        //    coaches = data.map((item) => Coach.fromJson(item)).toList();
        //  coaches = result;
        isLoading = false;
        update();
      },
    );
  }
}

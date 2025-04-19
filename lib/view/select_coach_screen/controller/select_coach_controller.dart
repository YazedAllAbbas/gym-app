import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCoachController extends GetxController {
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  List<UserInfoModel> coaches = [];
  int selectedCoachIndex = 1;
  bool isSendingRequest = false;

  void selectCoach(int index) {
    selectedCoachIndex = index;
    update();
  }

  Future getCoaches() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();
    var result = await crud().getData(
      AppLink.coaches,
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
              title: "خطأ", middleText: "لا يوجد اتصال بالإنترنت.");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "خطأ", middleText: "حدث خطأ في الخادم.");
        }
        update();
      },
      (success) {
        // إذا نجح الطلب
        responce = StatusRequest.success;
        // coaches = success.map((item) => Coach.fromJson(item)).toList();
        // List<dynamic> data = success;

        coaches = success.map((item) => UserInfoModel.fromJson(item)).toList();

        //    coaches = data.map((item) => Coach.fromJson(item)).toList();
        //  coaches = result;
        isLoading = false;
        update();
      },
    );
  }

  Future sendRequestToCoach(String coachId) async {
    try {
      Get.dialog(
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                "Please wait...",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  color: Color(0xFFF0F8FF),
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5), // خلفية شفافة داكنة
      );

      // الحصول على id المتدرب من SharedPreferences
      // String? userId = await MyService().getStringValue(AppKeys.userIdKey);

      // if (userId == null) {
      //   Get.snackbar("Error", "User ID not found. Please login again.",
      //       snackPosition: SnackPosition.BOTTOM);
      //   return;
      // }
      // UserModel? user =
      //     await MyService().getUserData(); // جلب كامل بيانات المستخدم

      // if (user == null) {
      //   Get.snackbar("Error", "User not logged in. Please login again.",
      //       snackPosition: SnackPosition.BOTTOM);
      //   return;
      // }

      // String userId = user.user.id.toString();
      // final user = UserSession.currentUser;

      // String userId = user!.user.id.toString();
      isSendingRequest = true;
      update();
      final UserController userController = Get.find();
      String userId = userController.currentUser!.id.toString();
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${userId}");

      print("Sending request to: ${AppLink.sendjoinrequest}/$userId/$coachId");
      print("Request Body: ${jsonEncode({
            "user_id": userId,
            "coach_id": coachId,
          })}");
      Either<StatusRequest, Map> result = await crud().postData(
        "${AppLink.sendjoinrequest}/$userId/$coachId/", // رابط API لإرسال الطلب
        {
          "user_id": userId,
          "coach_id": coachId,
        },
        {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      // إخفاء شاشة التحميل
      if (Get.isDialogOpen!) {
        Get.back();
      }
      result.fold(
        (failure) {
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
                title: "Error", middleText: "No internet connection.");
          } else if (failure == StatusRequest.serverFailure) {
            Get.defaultDialog(title: "Error", middleText: "Server error.");
          }
        },
        (success) {
          print("Response body: $success");
          Get.snackbar(" ", "Request sent successfully",
              snackPosition: SnackPosition.BOTTOM);
        },
      );
    } catch (e) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      print("Error: $e");
      Get.snackbar("Error", "An unexpected error occurred.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isSendingRequest = false;
      update();
    }
  }

  void onInit() {
    super.onInit();
    getCoaches();
  }

  void onClose() {
    super.onClose();
  }
}

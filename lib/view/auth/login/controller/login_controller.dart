import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';

  String? validUsername(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    } else if (data.length < 3) {
      return 'name must contain at least 3 characters';
    } else {
      return null;
    }
  }

  String? validPassword(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    }
    // else if (data.length < 6) {
    //   return 'يجب أن تكون كلمة المرور على الأقل 6 أحرف';
    // }
    else {
      return null;
    }
  }

  Future login() async {
    print("firstName: ${usernameController.text}");

    print("Password: ${passwordController.text}");
    if (!formKey.currentState!.validate()) {
      return;
    }
    this.isLoading = false;
    this.responce = StatusRequest.loading;
    update();
    Either<StatusRequest, Map> result = await crud().postData(AppLink.login, {
      "username": this.usernameController.text,
      "password": this.passwordController.text,
    }, {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    result.fold(
      (failure) {
        // حالة الفشل
        isLoading = false;
        if (failure == StatusRequest.failure) {
          this.responceMessage = crud.message;
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
        // حالة النجاح
        isLoading = false;
        responce = StatusRequest.success;
        final userController = Get.put(UserController(), permanent: true);
        await userController.getInfo();

        Get.snackbar(
          " ",
          // successMessage,
          'Success',
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

        String userType = userController.currentUser!.userType;
        await MyService().saveStringValue(AppKeys.userTypeKey, userType);

        if (userType == 'coach') {
          Get.offNamed(Routes.coachHomeScreen);
        } else if (userType == 'trainer') {
          Get.offNamed(Routes.homeScreen);
        } else {
          Get.snackbar(
            "Error",
            "User type not recognized",
            snackPosition: SnackPosition.BOTTOM,
          );
        }

        update();
      },
    );
  }
}

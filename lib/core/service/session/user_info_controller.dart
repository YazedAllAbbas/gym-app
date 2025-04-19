import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserInfoModel? currentUser;
  bool isUserLoading = false;

  Future<void> getInfo() async {
    print('>>>>>>>>>>>>>>>>>>>>>>>${ConstData.token}');
    isUserLoading = true;
    update();

    try {
      var result = await crud().getObject(
        AppLink.getInfo,
        headers: {
          'Authorization': 'Bearer ${ConstData.token}',
          'Accept': 'application/json',
        },
      );
      result.fold(
        (failure) {
          isUserLoading = false;
          print("Error fetching user details: $failure");
          Get.snackbar("Error", "Failed to load user details");
          update();
        },
        (success) {
          currentUser = UserInfoModel.fromJson(success['user']);
          isUserLoading = false;
          update();
        },
      );
    } catch (e) {
      isUserLoading = false;
      print("Unexpected error: $e");
      Get.snackbar("Error", "Unexpected error occurred");
      update();
    }
  }

  Future<Either<StatusRequest, Map>> updateUserField(
      String field, String value) async {
    try {
      isUserLoading = true;
      update();

      Map<String, String> data = {
        "field": field,
        "value": value,
      };

      var response = await crud().updateData(
        AppLink.update_profile,
        data,
        {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ConstData.token}',
          'Accept': 'application/json',
        },
      );

      return response.fold(
        (failure) {
          isUserLoading = false;
          update();
          print("Error updating field: $failure");
          return const Left(StatusRequest.failure);
        },
        (success) {
          switch (field) {
            case "first_name":
              currentUser!.firstName = value;
              break;
            case "last_name":
              currentUser!.lastName = value;
              break;
            case "email":
              currentUser!.email = value;
              break;
            case "phone":
              currentUser!.phone = value;
              break;
            case "weight":
              currentUser!.weight = double.parse(value);
              break;
            case "height":
              currentUser!.height = double.parse(value);
              break;
            case "gender":
              currentUser!.gender = value;
              break;
            case "goal":
              currentUser!.goal = value;
              break;
            case "experianse_level":
              currentUser!.experianseLevel = value;
              break;
            case "user_type":
              currentUser!.userType = value;
              break;
            default:
              print("Unknown field: $field");
          }

          isUserLoading = false;
          update();
          return Right(success);
        },
      );
    } catch (e) {
      isUserLoading = false;
      update();
      print("Unexpected error: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<void> deleteAccount() async {
    if (ConstData.token.isEmpty) {
      print("Token is null or empty");
      return;
    }

    Get.defaultDialog(
      title: "Confirm Deletion",
      middleText: "Are you sure you want to delete your account?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black54,
      onConfirm: () async {
        Get.back();
        isUserLoading = true;
        update();

        try {
          var result = await crud().deleteData(
            AppLink.delete_account,
            {
              'Authorization': 'Bearer ${ConstData.token}',
              'Accept': 'application/json',
            },
          );

          result.fold(
            (failure) {
              isUserLoading = false;
              update();
              print("Error deleting account: $failure");
              Get.snackbar("Error", "Failed to delete the account");
            },
            (success) async {
              print("Account deleted successfully: $success");

              await Get.find<MyService>().removeValue(AppKeys.storeTokenkey);

              ConstData.token = '';
              await Get.find<MyService>().setConstantToken();

              isUserLoading = false;
              update();
              Get.offAllNamed(Routes.splashScreen);
              Get.snackbar("Success", "Account has been successfully deleted");
            },
          );
        } catch (e) {
          isUserLoading = false;
          update();
          print("Unexpected error during account deletion: $e");
          Get.snackbar("Error", "حدث خطأ غير متوقع أثناء حذف الحساب");
        }
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}

import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/core/service/session/user_session.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController {
  final UserController userController = Get.find();
  
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  List<RequestModel> requests = [];
  RequestModel? selectedRequest;

  UserInfoModel? selectedUser;
  bool isUserLoading = false;

  void selectRequest(RequestModel request) {
    selectedRequest = request;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadRequests();
  }

  Future loadRequests() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();
    // String? coachId = await MyService().getStringValue(AppKeys.userIdKey);
    // final user = UserSession.currentUser;
    // String coachId = user!.user.id.toString();
    //  await userController.getInfo();
      String coachId = userController.currentUser!.id.toString();
    print("@@@@@@@@@@@@@@@${coachId}");
    var result = await crud().getData("${AppLink.getjoinrequests}/$coachId/");
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

        requests = success.map((item) => RequestModel.fromJson(item)).toList();
        print(requests);
        //    coaches = data.map((item) => Coach.fromJson(item)).toList();
        //  coaches = result;
        isLoading = false;
        update();
      },
    );
  }

  Future<void> fetchUserDetails(int userId) async {
    isUserLoading = true;
    update();

    try {
      var result = await crud().getObject("${AppLink.getuser}/$userId");
      result.fold(
        (failure) {
          // في حال حدوث خطأ
          isUserLoading = false;

          print(
              "______________________________________Error fetching user details: $failure");
          Get.snackbar(
            "Error",
            "Failed to load user details",
            snackPosition: SnackPosition.BOTTOM,
          );
          update();
        },
        (success) {
          // في حال نجاح الطلب
          selectedUser = UserInfoModel.fromJson(success);
          isUserLoading = false;
          update(); // تحديث الواجهة لعرض بيانات المستخدم
        },
      );
    } catch (e) {
      isUserLoading = false;
      print(
          "______________________________________Error fetching user details: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
        snackPosition: SnackPosition.BOTTOM,
      );
      update();
    }
  }

  Future<void> responsetojoinrequest(int requestId, String action) async {
    try {
      isLoading = true;
      update();
// final user = UserSession.currentUser;
//     String coachId = user!.user.id.toString();
      // final UserController userController = Get.find();
    //  await userController.getInfo();
      String coachId = userController.currentUser!.id.toString();

      // بناء الرابط مع تمرير coach_id و request_id
      //  String url = "${AppLink.responsetojoinrequest}/$coachId/$requestId/";
      var result = await crud().postData(
        "${AppLink.responsetojoinrequest}/$coachId/$requestId/",
        {
          "action": action, // الإجراء (قبول: "accept" أو رفض: "reject")
        },
        {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      result.fold(
        (failure) {
          isLoading = false;
          Get.snackbar(
            "Error",
            "Failed to ${action == 'accept' ? 'accept' : 'reject'} the request.",
            snackPosition: SnackPosition.BOTTOM,
          );
          update();
        },
        (success) {
          // إزالة الطلب من القائمة بعد معالجته
          requests.removeWhere((request) => request.id == requestId);
          isLoading = false;
          Get.snackbar(
            "Success",
            "Request ${action == 'Accept' ? 'accepted' : 'Reject'} successfully.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: action == 'Accept' ? Colors.green : Colors.red,
            colorText: Colors.white,
          );
          update();
        },
      );
    } catch (e) {
      isLoading = false;
      Get.snackbar(
        "Error",
        "An unexpected error occurred.",
        snackPosition: SnackPosition.BOTTOM,
      );
      update();
    }
  }
}

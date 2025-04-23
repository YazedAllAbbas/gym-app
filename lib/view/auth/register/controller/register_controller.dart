import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/core/service/session/user_session.dart';
import 'package:final_project/models/gender_model/gender_model.dart';
import 'package:final_project/models/height_model/height_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/models/user_model/user_model.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  double currentValue = 50.0;
  String selectedUserType = "trainer";
  int experianseLevelIndex = 0;
  List<String> goals = [
    "lose_weight",
    "build_muscle",
    "endurance",
  ];
  List<String> experianse_level = [
    "beginner",
    "intermediate",
    "advanced",
  ];
  int selectedGoalIndex = 1;

  void changeUserType(String userType) {
    selectedUserType = userType;
    update();
  }

  void selectGoal(int index) {
    selectedGoalIndex = index;
    update();
  }

  void experianseLevel(int index) {
    experianseLevelIndex = index;
    update();
  }

  String? validGlobal(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    } else if (!(data.contains('@gmail.com'))) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  String? validPassword(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    } else if (data.length < 6) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  String? validUsername(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    } else if (data.length < 3) {
      return 'name must contain at least 3 characters';
    } else {
      return null;
    }
  }

  // String? validConfirmPassword(String? data) {
  //   if (data == null || data.isEmpty) {
  //     return 'هذا الحقل مطلوب';
  //   } else if (data != passwordController.text) {
  //     return 'كلمة المرور غير متطابقة';
  //   } else {
  //     return null;
  //   }
  // }
  String? validPhoneNumber(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(data)) {
      return 'Please enter a valid phone number with 10 digits';
    } else {
      return null;
    }
  }

  void generateUsername() {
    usernameController.text =
        '${firstnameController.text.trim()} ${lastnameController.text.trim()}';
    update();
  }

  Future register() async {
    print("firstName: ${firstnameController.text}");
    print("lastName: ${lastnameController.text}");
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    // print("Password Confirmation: ${confirmPasswordController.text}");
    // if (!registerFormKey.currentState!.validate()) {
    //   return;
    // }

    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();
    double height = heightModel.value.height;
    Either<StatusRequest, Map> result =
        await crud().postData(AppLink.register, {
      "username": this.usernameController.text,
      "first_name": this.firstnameController.text,
      "last_name": this.lastnameController.text,
      "email": this.emailController.text,
      "password": this.passwordController.text,
      "weight": currentValue.toString(),
      "height": height.toString(),
      "experianse_level": experianse_level[experianseLevelIndex],
      "goal": goals[selectedGoalIndex],
      "gender": selectedGenderIndex.value,
      "phone": this.phoneController.text,
    }, {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
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
        isLoading = false;
        responce = StatusRequest.success;
        final userController = Get.put(UserController(), permanent: true);
        await userController.getInfo();

        // String userId = success['user']['id'].toString();
        // await MyService().saveStringValue(AppKeys.userIdKey, userId.toString());

//        UserModel userModel = UserModel.fromJson(Map<String, dynamic>.from(success));
// await MyService().saveStringValue(
//     AppKeys.userDataKey,
//     json.encode(userModel.toJson()) // تحويل كامل الكائن لـ JSON
//   );
//   await UserSession.loadUser();
        // حفظ بيانات المستخدم باستخدام SharedPreferences
        // await MyService().saveStringValue(
        //   AppKeys.userIdKey, userModel.user.id.toString());

        String successMessage = "success";
        Get.snackbar(
          " ",
          successMessage,
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
        Get.offAllNamed(Routes.selectCoachScreen);

        update();
      },
    );
  }

  void updateCurrentValue(double value) {
    currentValue = value;
    update();
  }

  var genders = <Gender>[
    Gender(image: "assets/images/male.png", caption: "male"),
    Gender(image: "assets/images/female.png", caption: "female"),
  ].obs;

  var selectedGenderIndex = 0.obs;

  void updateSelectedGender(int index) {
    selectedGenderIndex.value = index;
  }


  String SelectedGender() {
    return genders[selectedGenderIndex.value].caption;
  }

  var heightModel = HeightModel().obs;

  void updateHeight(double value) {
    heightModel.update((val) {
      val?.height = value;
    });
  }


  double getHeight() {
    return heightModel.value.height;
  }

  void onClose() {
    super.onClose();
  }
}

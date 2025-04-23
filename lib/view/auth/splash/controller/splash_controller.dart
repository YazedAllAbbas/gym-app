import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    //  String? userType = await MyService().getStringValue(AppKeys.userTypeKey);
    // ConstData.token == "" ? Get.offNamed('/usertypeScreen') : Get.off(const HomeScreen());
    if (ConstData.token == "") {
      Get.offNamed('/usertypeScreen');
    } else {
      final userController = Get.put(UserController(), permanent: true);
      await userController.getInfo();
      if (userController.currentUser!.userType == 'coach') {
        Get.offAllNamed(Routes.coachHomeScreen);
      } else if (userController.currentUser!.userType == 'trainer') {
        Get.offAllNamed(Routes.homeScreen);
      }
    }
  }
}

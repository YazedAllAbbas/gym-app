import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/core/service/session/user_session.dart';
import 'package:get/get.dart';

class CoachHomeController extends GetxController {
  late String storedUsername = '';

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  void fetchUsername() {
  
       final UserController userController = Get.find();
      String firstName = userController.currentUser!.username;
    if (userController != null) {
      storedUsername=firstName;
    } else {
      storedUsername = 'user';
    }
    update();
  }

  
}

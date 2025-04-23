import 'package:final_project/core/class/check_internat.dart';
import 'package:get/get.dart';

import '../core/class/crud.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(crud());
    Get.put(checkInternet()); 


  }
}

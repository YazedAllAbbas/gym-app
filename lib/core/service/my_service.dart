import 'dart:convert';

import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/models/user_model/user_model.dart';
import 'package:get/get.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (await this.getStringValue(AppKeys.storeTokenkey) != null) {
      ConstData.token = (await this.getStringValue(AppKeys.storeTokenkey))!;
    }
    print("this is token");
    print(ConstData.token);
    return this;
  }

  Future<void> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  Future<void> removeValue(String key) async {
  await sharedPreferences.remove(key);
}

  // Future<void> setConstantToken() async {
  //   ConstData.token = (await this.getStringValue(AppKeys.storeTokenkey))!;
  //   print('Token:${ConstData.token}');
  // }
  Future<void> setConstantToken() async {
    String? token = await this.getStringValue(AppKeys.storeTokenkey);
    if (token != null) {
      ConstData.token = token;
      print('Token:${ConstData.token}');
    } else {
      print("No token found in sharedPreferences");
    }
  }


  //  Future<void> saveUserData(UserModel user) async {
  //   await saveStringValue(AppKeys.userDataKey, json.encode(user.toJson()));
  // }

  // Future<UserModel?> getUserData() async {
  //   String? data = await getStringValue(AppKeys.userDataKey);
  //   if (data != null) {
  //     return UserModel.fromJson(json.decode(data));
  //   }
  //   return null;
  // }
  
}


initialServices() async {
  await Get.putAsync(() => MyService().init());
}


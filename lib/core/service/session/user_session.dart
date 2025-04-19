
// import 'dart:convert';
// import 'package:final_project/core/class/crud.dart';
// import 'package:final_project/core/service/app_keys.dart';
// import 'package:final_project/core/service/link.dart';
// import 'package:final_project/models/user_info_model/user_info_model.dart';
// import 'package:final_project/models/user_model/user_model.dart';
// import 'package:final_project/core/service/my_service.dart';
// import 'package:get/get.dart';


// class UserSession {
//   static UserInfoModel? currentUser;



//   Future<void> getInfo(int userId) async {
//     // isUserLoading = true;
//     // update(); 

//     try {
//       var result = await crud().getObject("${AppLink.getInfo}/$userId");
//       result.fold(
//         (failure) {
//           // في حال حدوث خطأ
//           // isUserLoading = false;
          
//           print("______________________________________Error fetching user details: $failure");
//           Get.snackbar(
//             "Error",
//             "Failed to load user details",
//             snackPosition: SnackPosition.BOTTOM,
//           );
//           update();
//         },
//         (success) {
//           // في حال نجاح الطلب
//          currentUser = UserInfoModel.fromJson(success);
//           // isUserLoading = false;
//           update(); // تحديث الواجهة لعرض بيانات المستخدم
//         },
//       );
//     } catch (e) {
//       isUserLoading = false;
//       print("______________________________________Error fetching user details: $e");
//       Get.snackbar(
//         "Error",
//         "An unexpected error occurred",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       update();
//     }
//   }


//   // تحميل بيانات المستخدم من SharedPreferences مرة واحدة
//   // static Future<void> loadUser() async {
//   //   if (_currentUser == null) { // تحميل البيانات فقط إذا لم تكن موجودة بالفعل في الذاكرة
//   //     String? userData = await MyService().getStringValue(AppKeys.userDataKey);
//   //     if (userData != null) {
//   //       _currentUser = UserModel.fromJson(json.decode(userData));
//   //     }
//   //   }
//   // }

//   // // الوصول إلى بيانات المستخدم الحالية من الذاكرة
//   // static UserModel? get currentUser => _currentUser;

//   // // تخزين بيانات المستخدم في SharedPreferences والذاكرة
//   // static Future<void> saveUser(UserModel user) async {
//   //   _currentUser = user; // تخزين البيانات في الذاكرة
//   //   await MyService().saveStringValue(
//   //     AppKeys.userDataKey,
//   //     json.encode(user.toJson()), // تخزين البيانات في SharedPreferences
//   //   );
//   // }


// }
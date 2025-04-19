// import 'package:final_project/view/requests_screen/controller/requests_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:final_project/core/const_data/app_colors.dart';
// import 'package:final_project/view/auth/widget/custom_botton.dart';
// import 'package:final_project/models/request_model/request_model.dart';

// class RequestDetailsScreen extends StatelessWidget {
  
//    RequestDetailsScreen ({super.key});

//   @override
//   Widget build(BuildContext context) {
//       var media = MediaQuery.of(context).size;
//     final RequestsController controller = Get.find();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Request Details"),
//         backgroundColor: AppColor.primaryColor,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Trainer Name: ${controller.selectedRequest!.trainerName}",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               "Request ID: ${controller.selectedRequest!.id}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 12),
//             Text(
//               "Status: ${controller.selectedRequest!.createdAt}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Spacer(),
//             CustomButton(
//               text: "Accept Request",
//               onTap: () {
//                 // تنفيذ عملية قبول الطلب هنا
//                 // مثال: controller.acceptRequest(request.id);
//                 Get.snackbar(
//                   "Request Accepted",
//                   "You have successfully accepted the request",
//                   snackPosition: SnackPosition.BOTTOM,
//                   backgroundColor: Colors.green[200],
//                   colorText: Colors.white,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
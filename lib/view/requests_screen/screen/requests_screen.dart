import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/requests_screen/widget/request_detail_sheet.dart';
import 'package:final_project/view/home/coach_home_screen/controller/coach_home_controller.dart';
import 'package:final_project/view/request_details_screen/screen/request_details_screen.dart';
import 'package:final_project/view/requests_screen/controller/requests_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final RequestsController controller = Get.put(RequestsController());
    return GetBuilder<RequestsController>(
        //  init: SelectCoachController(),
        builder: (controller) => Scaffold(
                body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: media.width * 0.03,
                    // ),
                    Text("Join Requests",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            //  fontWeight: FontWeight.w700,
                            fontFamily: 'SourceSerif4')),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        // عرض عدد الطلبات بشكل ديناميكي
                        Text(
                          'Total: ${controller.requests.length}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : controller.requests.isEmpty
                              ? Center(
                                  child: Text(
                                    'No requests available',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: controller.requests.length,
                                  itemBuilder: (context, index) {
                                    final request = controller.requests[index];
                                    return GestureDetector(
                                      onTap: () async {
                                     controller.selectRequest(request);
                                        await controller
                                            .fetchUserDetails(request.userId);
                                        //  controller.fetchUserDetails(request.userId);
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   isScrollControlled: true,
                                        //   backgroundColor: Colors.transparent,
                                        //   builder: (_) => RequestDetailsSheet(
                                        //     request: request,
                                        //     user: controller
                                        //         .selectedUser, // تمرير بيانات المستخدم للـ Sheet
                                        //     isLoading: controller
                                        //         .isUserLoading, // تمرير حالة التحميل
                                        //   ),
                                        // );
                                        if (!controller.isUserLoading) {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (_) => RequestDetailsSheet(
                                              request: request,
                                              user: controller.selectedUser,
                                              isLoading:
                                                  controller.isUserLoading,
                                            ),
                                          );
                                        }

                                        //  showRequestDetailsSheet(context, request);

                                        // Get.to(() => RequestDetailsScreen());
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            // الدائرة التي تحتوي على الحرف الأول من اسم المستخدم
                                            CircleAvatar(
                                              backgroundColor:
                                                  AppColor.primaryColor,
                                              child: Text(
                                                request.trainerName[0]
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            // اسم المستخدم
                                            Expanded(
                                              child: Text(
                                                request.trainerName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ),

                    // SizedBox(
                    //   height: media.width * 0.2,
                    // ),
                    // CustomButton(
                    //   text: 'Next',
                    //   onTap: () {
                    //     FocusScope.of(context).unfocus();
                    //     // Get.offNamed('/secondScreen');
                    //     //  controller.register();

                    //     // Get.toNamed('/experianseScreen');
                    //   },
                    // ),
                    // SizedBox(height: 20.h,),
                  ],
                ),
              ),
            )));
  }

//   void showRequestDetailsSheet(BuildContext context, RequestModel request) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (context) {
//       return DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         maxChildSize: 0.9,
//         minChildSize: 0.4,
//         builder: (_, controller) => Container(
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//           ),
//           child: SingleChildScrollView(
//             controller: controller,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     height: 5,
//                     width: 50,
//                     margin: EdgeInsets.only(bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "طلب الانضمام",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Colors.blueGrey,
//                       child: Text(
//                         request.trainerName[0].toUpperCase(),
//                         style: TextStyle(color: Colors.white, fontSize: 24),
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           request.trainerName,
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 4),
//                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: Colors.orange[100],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             "متوسط الخطورة",
//                             style: TextStyle(color: Colors.orange[800], fontSize: 12),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20),

//                 Text("مستوى التقييم"),
//                 SizedBox(height: 8),
//                 LinearProgressIndicator(
//                   value: 0.5,
//                   color: Colors.amber,
//                   backgroundColor: Colors.grey[200],
//                   minHeight: 8,
//                 ),
//                 SizedBox(height: 20),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Text("الطلب الحالي", style: TextStyle(fontSize: 12, color: Colors.grey)),
//                         SizedBox(height: 4),
//                         Text("2.31", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("السابق", style: TextStyle(fontSize: 12, color: Colors.grey)),
//                         SizedBox(height: 4),
//                         Text("1.94", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("السوق", style: TextStyle(fontSize: 12, color: Colors.grey)),
//                         SizedBox(height: 4),
//                         Text("2.51", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),

//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           Get.snackbar("تم القبول", "تم قبول ${request.trainerName}");
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           padding: EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         ),
//                         child: Text("قبول"),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           Get.snackbar("تم الرفض", "تم رفض ${request.trainerName}");
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           padding: EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         ),
//                         child: Text("رفض"),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
}

// class RequestsScreen extends StatelessWidget {
//   const RequestsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;

//     // إنشاء الـ Controller الخاص بالصفحة
//     final RequestsController controller = Get.put(RequestsController());

//     return Scaffold(

//       body: GetBuilder<RequestsController>(
//         builder: (controller) {
//           // التحقق من حالة التحميل
//           if (controller.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // التحقق إذا كانت المصفوفة فارغة
//           if (controller.requests.isEmpty) {
//             return Center(
//               child: Text(
//               'No requests available',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             );
//           }

//           // عرض قائمة المستخدمين
//           return ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: controller.requests.length,
//             itemBuilder: (context, index) {
//               final request = controller.requests[index]; // المستخدم الحالي
//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: ListTile(
//                leading: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     // child: Text(

//                     //   style: TextStyle(color: Colors.white),
//                     // ),
//                   ),
//                   title: Text(
//                 request.trainerName,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),

//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

// }

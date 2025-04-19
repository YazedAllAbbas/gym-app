import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/requests_screen/widget/request_detail_sheet.dart';
import 'package:final_project/view/home/coach_home_screen/controller/coach_home_controller.dart';
import 'package:final_project/view/my_trainee/controller/my_trainee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTraineeScreen extends StatelessWidget {
  const MyTraineeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final MyTraineeController controller = Get.put(MyTraineeController());
    return GetBuilder<MyTraineeController>(
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
                        Text(
                          'Total: ${controller.trainees.length}',
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
                          : controller.trainees.isEmpty
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
                                  itemCount: controller.trainees.length,
                                  itemBuilder: (context, index) {
                                    final trainee = controller.trainees[index];
                                    return GestureDetector(
                                      onTap: () async {
                                        // controller.selectRequest(request);
                                        // await controller
                                        //     .fetchUserDetails(request.userId);
                                        //  controller.fetchUserDetails(request.userId);
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   isScrollControlled: true,
                                        //   backgroundColor: Colors.transparent,
                                        //   builder: (_) => RequestDetailsSheet(
                                        //     request: request,
                                        //     user: controller
                                        //         .selectedUser,
                                        //     isLoading: controller
                                        //         .isUserLoading, 
                                        //   ),
                                        // );
                                        // if (!controller.isUserLoading) {
                                        //   showModalBottomSheet(
                                        //     context: context,
                                        //     isScrollControlled: true,
                                        //     backgroundColor: Colors.transparent,
                                        //     builder: (_) => RequestDetailsSheet(
                                        //       request: request,
                                        //       user: controller.selectedUser,
                                        //       isLoading:
                                        //           controller.isUserLoading,
                                        //     ),
                                        //   );
                                        // }

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
                                                trainee.username
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
                                                trainee.username,
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
}

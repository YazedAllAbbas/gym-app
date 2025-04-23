import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/screen/build_program_screen.dart';
import 'package:final_project/view/coach/my_trainee/widget/trainee_details_sheet.dart';
import 'package:final_project/view/coach/requests_screen/widget/request_detail_sheet.dart';
import 'package:final_project/view/home/coach_home_screen/controller/coach_home_controller.dart';
import 'package:final_project/view/coach/my_trainee/controller/my_trainee_controller.dart';
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
            appBar: AppBar(
              title: const Text(
                "My trainees",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SourceSerif4",
                    shadows: [
                      Shadow(
                          color: Colors.black26,
                          blurRadius: 0.2,
                          offset: Offset(1, 2))
                    ]),
              ),
              centerTitle: true,
              backgroundColor: AppColor.primaryColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     IconButton(
                    //       icon: Icon(Icons.arrow_back),
                    //       onPressed: () {
                    //         Get.back();
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: media.width * 0.03,
                    // // ),
                    // Text("My trainee",
                    //     style: TextStyle(
                    //         fontSize: 26,
                    //         fontWeight: FontWeight.bold,
                    //         //  fontWeight: FontWeight.w700,
                    //         fontFamily: 'SourceSerif4')),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
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
                                    final hasProgram =
                                        controller.traineeProgramStatus[
                                                trainee.id.toString()] ??
                                            false;
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
                                              EdgeInsets.symmetric(vertical: 6),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          decoration: BoxDecoration(
                                            //  color: Color(0xffFFEC8B),
                                            // color: Color(0xffB6F075),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1),

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                blurRadius: 6,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center, // ✨ الصورة في المنتصف عموديًا
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    AppColor.primaryColor,
                                                radius: 28,
                                                child: Text(
                                                  trainee.username
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(width: 16),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      trainee.username,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Get.to(() =>
                                                            BuildProgramScreen(
                                                                user:
                                                                    trainee!));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            //  Color(
                                                            //     0xFFDFFFB3),

                                                            Color(0xFFFFF6C2),
                                                        elevation: 0,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 18,
                                                                vertical: 6),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        hasProgram
                                                            ? 'Show Program'
                                                            : 'Make Program',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 18,
                                                    color: Colors.grey),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    builder: (_) =>
                                                        TraineeDetailsSheet(
                                                      trainee: trainee,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ));
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

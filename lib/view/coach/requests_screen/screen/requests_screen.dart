import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/coach/requests_screen/widget/request_detail_sheet.dart';
import 'package:final_project/view/coach/requests_screen/controller/requests_controller.dart';
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
          appBar: AppBar(
              title: const Text(
                "Join Requests",
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
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
                  ],
                ),
              ),
            )));
  }
}

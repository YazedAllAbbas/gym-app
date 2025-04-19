import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/requests_screen/controller/requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/models/request_model/request_model.dart';
import 'package:intl/intl.dart';

class RequestDetailsSheet extends StatelessWidget {
  final RequestModel request;
  final UserInfoModel? user; // بيانات المستخدم
  final bool isLoading; // حالة التحميل

  const RequestDetailsSheet({
    Key? key,
    required this.request,
    required this.user,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          //  color: Color(0xffE8EAF6),
          //  color: Color(0xffDDEEFF),
          //   color: Color(0xffF0F8FF),
          //   color:  Color(0xFFFFF0F5),
          //   color:  Color(0xFFFFE4E1),
          //   color:Color(0xFFFFF5F7),
          // color: Color(0xFFE3F2FD),
          color: Color(0xFFF0F8FF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 50,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.primaryColor,
                    child: Text(
                      request.trainerName[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.trainerName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Request sent at: ${DateFormat('yyyy-MM-dd hh:mm a').format(request.createdAt)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (user != null) ...[
                const Text(
                  "User Details:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Text(
                //   "Name: ${user!.username}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // const SizedBox(height: 8),
                Text(
                  "Name: ${user!.email}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Goal: ${user!.goal}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Height: ${user!.height}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Weight: ${user!.weight}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Experianse Level: ${user!.experianseLevel}",
                  style: const TextStyle(fontSize: 16),
                ),
              ] else
                Text(
                  "Failed to load user details.",
                  style: TextStyle(fontSize: 16, color: AppColor.grey),
                ),
              const SizedBox(height: 30),
            
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Get.find<RequestsController>()
                            .responsetojoinrequest(
                          request.id, 
                          "Accept", 
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Get.find<RequestsController>()
                            .responsetojoinrequest(
                          request.id, 
                          "Reject", 
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightgrey,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Reject",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

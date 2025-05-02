import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:flutter/material.dart';

class CoachDetailsSheet extends StatelessWidget {
  final UserInfoModel coach;
  final VoidCallback onSendRequest;
  const CoachDetailsSheet({
    Key? key,
    required this.coach,
    required this.onSendRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.85,
      minChildSize: 0.4,
      builder: (_, scrollController) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F8FF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.primaryColor,
                    child: Text(
                      coach.username[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    coach.username,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Email: ${coach.email}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Experience Level: ${coach.experianseLevel}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Phone: ${coach.phone}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 50),
              // CustomButton(
              //   text: "Send Request",
              //   onTap: () {
              //     Navigator.pop(context); // اغلاق الشيت
              //     onSendRequest(); // تنفيذ الإجراء
              //   },
              // ),


              
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                     Navigator.pop(context); // اغلاق الشيت
                     onSendRequest();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Send Request",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightgrey,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("close",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
              //  ElevatedButton(
              //         onPressed: () async {
              //          Navigator.pop(context); // اغلاق الشيت
              //   onSendRequest(); 
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: AppColor.primaryColor,
              //           padding: const EdgeInsets.symmetric(vertical: 14),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(26),
              //           ),
              //         ),
              //         child: const Text("Send Request",
              //             style: TextStyle(color: Colors.white)),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
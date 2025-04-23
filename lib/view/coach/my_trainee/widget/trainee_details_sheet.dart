import 'package:final_project/models/request_model/request_model.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:flutter/material.dart';

class TraineeDetailsSheet extends StatelessWidget {
  final UserInfoModel trainee;

  const TraineeDetailsSheet({super.key, required this.trainee});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                trainee.username,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text("Email: ${trainee.email}"),
              SizedBox(height: 8),
              Text("Phone: ${trainee.phone}"),
              SizedBox(height: 8),
              Text("Age: ${trainee.experianseLevel}"),
              SizedBox(height: 8),
              Text("Gender: ${trainee.gender}"),
              // يمكنك إضافة المزيد من الحقول هنا
            ],
          ),
        );
      },
    );
  }
}
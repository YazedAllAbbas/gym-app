import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/muscle_section_model/muscle_section_model.dart';
import 'package:flutter/material.dart';

class MuscleSectionCard extends StatelessWidget {
  final MuscleSectionModel muscle;
  final VoidCallback onTap;

  const MuscleSectionCard({
    super.key,
    required this.muscle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEFF3F2).withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3.5,
            color: AppColor.primaryColor,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              muscle.muscleImage,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
        ),
        title: Text(
          muscle.muscleName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
            fontSize: 19,
            fontFamily: "SourceSerif4",
          ),
        ),
        trailing: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}

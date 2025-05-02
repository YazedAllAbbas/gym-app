import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/muscle_section_model/muscle_section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEFF3F2).withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.5.r,
            color: AppColor.primaryColor,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10.r),
      margin: EdgeInsets.symmetric(vertical: 7.r, horizontal: 16.r),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              muscle.muscleImage,
              fit: BoxFit.cover,
              width: 60.w,
              height: 60.h,
            ),
          ),
        ),
        title: Text(
          muscle.muscleName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
            fontSize: isPortrait ? 19.sp : 12.sp,
            fontFamily: "SourceSerif4",
          ),
        ),
        trailing: Icon(
          Icons.navigate_next_rounded,
          size: isPortrait ? 20.r : 32.r,
        ),
      ),
    );
  }
}

import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/drawer/drawer_screen.dart';
import 'package:final_project/view/home/static/static_trainer_section_data/static_scection_data.dart';
import 'package:final_project/view/home/widget/trainer_section_card/trainer_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerHomeScreen extends StatelessWidget {
  const TrainerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            shadows: const [
              Shadow(
                color: Colors.black26,
                blurRadius: 0.2,
                offset: Offset(1, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: 8.w),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 30.r,
          ),
          SizedBox(width: 18.w),
        ],
      ),
      drawer: DrawerScreen(),
      body: GridView.builder(
        itemCount: StaticTrainerScectionData.trainersSections.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4,
          crossAxisSpacing: 5.r,
          mainAxisSpacing: 15.0.r,
          childAspectRatio: isPortrait ? 0.9.r : 1.1.r,
        ),
        itemBuilder: (context, index) => SizedBox(
          // height: 100,
          child: TrainerSectionCard(
            index: index,
          ),
        ),
      ),
    );
  }
}

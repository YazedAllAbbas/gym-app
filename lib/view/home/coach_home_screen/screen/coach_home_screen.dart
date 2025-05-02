import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/static/static_coach_section_data/static_coach_section_data.dart';
import 'package:final_project/view/home/drawer/drawer_screen.dart';
import 'package:final_project/view/home/widget/coach_section_card/coach_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoachHomeScreen extends StatelessWidget {
  const CoachHomeScreen({super.key});

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
        actions: const [
          SizedBox(width: 8),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 18),
        ],
      ),
      drawer: DrawerScreen(),
      body: GridView.builder(
        itemCount: StaticCoachScectionData.coachSections.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4,
          crossAxisSpacing: 5.r,
          mainAxisSpacing: 15.0.r,
          childAspectRatio: isPortrait ? 0.9.r : 1.1.r,
        ),
        itemBuilder: (context, index) => SizedBox(
          // height: 100,
          child: CoachSectionCard(
            index: index,
          ),
        ),
      ),
    );
  }
}

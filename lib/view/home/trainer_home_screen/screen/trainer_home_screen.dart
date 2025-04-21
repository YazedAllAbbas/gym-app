import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/drawer/drawer_screen.dart';
import 'package:final_project/view/home/static/static_trainer_section_data/static_scection_data.dart';
import 'package:final_project/view/home/widget/trainer_section_card/trainer_section_card.dart';
import 'package:flutter/material.dart';

class TrainerHomeScreen extends StatelessWidget {
  const TrainerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            shadows: [
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
        itemCount: StaticTrainerScectionData.trainersSections.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.93,
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

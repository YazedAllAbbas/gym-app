import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/drawer/drawer_screen.dart';
import 'package:final_project/view/home/static_section_data/static_scection_data.dart';
import 'package:final_project/view/home/widget/section_card/section_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 8,
          ),
        ],
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
                    offset: Offset(1, 2))
              ]),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: DrawerScreen(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: GridView.builder(
            itemCount: StaticScectionData.sections.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 35,
              mainAxisSpacing: 30,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) => SectionCard(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

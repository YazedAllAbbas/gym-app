import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/static/static_trainer_section_data/static_scection_data.dart';
import 'package:final_project/view/home/widget/marquee_text/marquee_text.dart';
import 'package:flutter/material.dart';

class TrainerSectionCard extends StatelessWidget {
  final int index;
  TrainerSectionCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          StaticTrainerScectionData.trainersSections[index].page_next_fun();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppColor.primaryColor),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(65),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Colors.black45,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(65),
                        topLeft: Radius.circular(15),
                      ),
                      child: Container(
                        child: Image.asset(
                          StaticTrainerScectionData
                                  .trainersSections[index].image_url.isNotEmpty
                              ? StaticTrainerScectionData
                                  .trainersSections[index].image_url
                              : "assets/images/default.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        StaticTrainerScectionData.trainersSections[index].name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "SourceSerif4",
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black12,
                              blurRadius: 0.4,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: MarqueeText(
                  StaticTrainerScectionData.trainersSections[index].title),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/static_section_data/static_scection_data.dart';
import 'package:final_project/view/home/widget/marquee_text/marquee_text.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final int index;
  const SectionCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          StaticScectionData.sections[index].page_next_fun();
        });
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(65),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black45,
              offset: Offset(1, 5),
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
                      child: Image.asset(
                        StaticScectionData.sections[index].image_url.isNotEmpty
                            ? StaticScectionData.sections[index].image_url
                            : "assets/images/default.png",
                        fit: BoxFit.cover,
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
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        StaticScectionData.sections[index].name,
                        style: const TextStyle(
                          fontSize: 11,
                          fontFamily: "SourceSerif4",
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black12,
                              blurRadius: 0.1,
                              offset: Offset(1, 1),
                            )
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
              child: MarqueeText(StaticScectionData.sections[index].title),
            ),
          ],
        ),
      ),
    );
  }
}

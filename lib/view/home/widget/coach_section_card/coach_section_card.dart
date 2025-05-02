import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/home/static/static_coach_section_data/static_coach_section_data.dart';
import 'package:final_project/view/home/widget/marquee_text/marquee_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoachSectionCard extends StatelessWidget {
  final int index;
  const CoachSectionCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          StaticCoachScectionData.coachSections[index].page_next_fun();
        });
      },
      child: Container(
        margin:
            EdgeInsets.only(left: 14.r, right: 14.r, top: 12.r, bottom: 5.r),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.w, color: AppColor.primaryColor),
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
                      child: Image.asset(
                        StaticCoachScectionData
                                .coachSections[index].image_url.isNotEmpty
                            ? StaticCoachScectionData
                                .coachSections[index].image_url
                            : "assets/images/default.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(isPortrait ? 6.r : 10.r),
                    child: Container(
                      padding: EdgeInsets.only(left: 7.r, right: 7.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        StaticCoachScectionData.coachSections[index].name,
                        style: TextStyle(
                          fontSize: screenWidth > 1000
                              ? 15.sp
                              : isPortrait
                                  ? 10.sp
                                  : 6.sp,
                          fontFamily: "SourceSerif4",
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          shadows: const [
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
                  StaticCoachScectionData.coachSections[index].title),
            ),
          ],
        ),
      ),
    );
  }
}

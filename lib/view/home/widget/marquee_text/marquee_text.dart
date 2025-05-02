// import 'package:final_project/custom_widgets/list_tile_drawer.dart';

import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class MarqueeText extends StatelessWidget {
  final String text;
  const MarqueeText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      height: 30,
      child: Marquee(
          text: text,
          style: TextStyle(
              fontFamily: "SourceSerif4",
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.white),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          blankSpace: 60.0,
          velocity: 40.0,
          pauseAfterRound: const Duration(seconds: 0),
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 0),
          decelerationDuration: const Duration(
            seconds: 0,
          )),
    );
  }
}

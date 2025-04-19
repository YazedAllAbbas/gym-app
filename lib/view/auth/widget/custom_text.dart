import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  final double height;
  final String fontFamily;
  final FontWeight fontWeight;

  const CustomText({super.key, 
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.height = 1,
    this.fontFamily = 'Cairo',
    this.fontWeight = FontWeight.normal, required double size, required FontWeight fontW,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height.h,
          fontSize: fontSize.sp,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          
        
        ),
      ),
    );
  }
}
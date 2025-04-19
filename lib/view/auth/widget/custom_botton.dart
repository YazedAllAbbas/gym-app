import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,  this.onTap ,required this.text});
  VoidCallback? onTap;
  String text;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          //color: const Color(0xff14DCB2),
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(26),
        ),
        width: double.infinity,
        height: 57,
        child: Center(
          child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.white,fontFamily: 'Poppins')),
        ),
      ),
    );
  }
}
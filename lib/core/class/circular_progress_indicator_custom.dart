import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorCustom extends StatelessWidget {
  const CircularProgressIndicatorCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
                strokeWidth: 7,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Please wait...",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "SourceSerif4",
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    blurRadius: 0.2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

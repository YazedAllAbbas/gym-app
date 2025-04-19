import 'package:flutter/material.dart';
// import '../styles/primaryTitleStyle.dart';

class PrimaryTitleWidget extends StatelessWidget {
  final String text;
  const PrimaryTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(   fontSize: 28,
                              //    fontWeight: FontWeight.bold,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SourceSerif4',
    //                            shadows: [
    //   Shadow(color: Colors.black12, blurRadius: 0.2, offset: Offset(1, 2))
    // ]
    ),
    );
  }
}
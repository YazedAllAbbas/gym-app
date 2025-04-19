import 'package:flutter/material.dart';

// ignore: camel_case_types
class Height_line extends StatelessWidget {
  const Height_line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 1,
      color: Colors.blue,
    );
  }
}
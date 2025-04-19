import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  final String test;
  final IconData icon;
  final VoidCallback fun;

  const ListTileDrawer({
    super.key,
    required this.test,
    required this.icon,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        test,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "SourceSerif4",
        ),
      ),
      leading: Icon(
        icon,
        color: AppColor.primaryColor,
      ),
      onTap: fun,
    );
  }
}

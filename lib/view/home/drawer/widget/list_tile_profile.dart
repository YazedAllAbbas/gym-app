import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileProfile extends StatelessWidget {
  ListTileProfile({
    required this.imageurl,
    required this.title,
    required this.color,
    required this.value,
    required this.fun,
    super.key,
  });
  String title;
  String imageurl;
  Color color;
  String value;
  var fun;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.all(3),
          title: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 15,
              fontFamily: "SourceSerif4",
            ),
          ),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: color,
            child: ClipRRect(
              child: Image.asset(
                imageurl!,
                fit: BoxFit.cover,
                height: 27,
                // width: 40,
              ),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value.length > 9 ? '${value.substring(0, 9)}..' : value,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              IconButton(
                onPressed: fun,
                icon: const Icon(Icons.mode_edit_outline,
                    size: 22, color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  String title, value;
  IconData icon;
  Color iconBg, iconColor;
  ActivityItem(
      {super.key,
        required this.title,
        required this.value,
        required this.icon,
        required this.iconColor,
        required this.iconBg});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(fontSize: 13, color: Colors.black38)),
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(4),
              child: Icon(
                icon,
                color:iconColor
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Color(0xff0c2c52)),
            )
          ],
        ));
  }
}
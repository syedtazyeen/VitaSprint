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
        child: Container(
          //margin: EdgeInsets.all(4),
          //padding: EdgeInsets.all(4),
          decoration: const BoxDecoration(
            //color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                ),
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                child: Icon(
                  icon,
                  color:iconColor,
                  size: 20,
                ),
              ),
              Text(title,
                  style: const TextStyle(fontSize: 12, color: Colors.black38)),
              Text(
                value,
                style: const TextStyle(fontSize: 14, color: Color(0xff0c2c52)),
              )
            ],
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vitasprint/widgets/rounded_container_aplha.dart';

class GridCard extends StatelessWidget {
  var name, value, unit, icon, iconBg, iconColor;

  GridCard(
      {super.key,
      required this.name,
      required this.value,
      required this.unit,
      required this.iconBg,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RoundedContainerAlpha(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                ),
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.only(right: 4),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              Expanded(child: Text("")),
              Text(
                name,
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          Expanded(child: Text("")),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 22),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                unit,
                style: TextStyle(fontSize: 13, color: Colors.black38),
              )
            ],
          )
        ],
      ),
    );
  }
}

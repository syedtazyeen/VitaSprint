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
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                ),
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(right: 4),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const Expanded(child: Text("")),
              Text(
                name,
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
          const Expanded(child: Text("")),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 22),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Text(
                unit,
                style: const TextStyle(fontSize: 13, color: Colors.black38),
              )
            ],
          )
        ],
      ),
    );
  }
}

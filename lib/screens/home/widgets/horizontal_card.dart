import 'package:flutter/material.dart';
import 'package:vitasprint/widgets/hexagon_container.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.035),
          borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            HexagonContainer(text: "74"),
            const Flexible(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Your Health Score",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "Based on your overall health stats, your score 74 is considered good!",
                    style: TextStyle(fontSize: 13, color: Colors.black38),
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

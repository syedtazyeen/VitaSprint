import 'package:flutter/material.dart';
import 'package:vita_sprint/widgets/hexagon_container.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            HexagonContainer(text: "74"),
            Flexible(
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
                    style: TextStyle(fontSize: 14, color: Colors.black38),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "Read more",
                    style: TextStyle(fontSize: 15, color: Colors.black38),
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

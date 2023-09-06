import 'package:flutter/material.dart';

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                ),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(20),
                child: const Text(
                  "74",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your Health Score",
                      style: TextStyle(fontSize: 16)),
                  const Padding(padding: EdgeInsets.all(2)),
                  Container(
                    width: MediaQuery.of(context).size.width * .52,
                    child: const Text(
                        "Based on your overall health stats, your score 74 is considered good! ",
                        style: TextStyle(fontSize: 14, color: Colors.black38)),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  const Text("Read more",
                      style: TextStyle(fontSize: 15, color: Colors.black38))
                ],
              )
            ],
          ),
        ));
  }
}
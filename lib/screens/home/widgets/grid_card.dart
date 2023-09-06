import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        decoration: const BoxDecoration(
          //color: Colors.yellow.shade100,
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(8),
        child: const Text("", style: TextStyle(fontSize: 14)),
      ),
    );
  }
}

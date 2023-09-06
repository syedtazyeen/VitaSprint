import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VitaBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  VitaBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.only(top: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8.0), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _navItem(Icons.looks, 'Activities', 0),
            _navItem(Icons.explore_outlined, 'Explore', 1),
            _navItem(Icons.perm_identity, 'Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = index == currentIndex;
    final color =
        isSelected ? Colors.black87 : Colors.black26; // Customize the text color
    //final fontSize = isSelected ? 18.0 : 16.0; // Customize the text size

    return Expanded(
        child: GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ));
  }
}


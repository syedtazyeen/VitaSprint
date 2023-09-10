import 'package:flutter/material.dart';
import 'package:vitasprint/constants/app_colors.dart';

class VitaBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const VitaBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _navItem(Icons.looks, 'Activities', 0,context),
            _navItem(Icons.explore_outlined, 'Explore', 1,context),
            _navItem(Icons.perm_identity, 'Profile', 2,context),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index, BuildContext context) {
    final isSelected = index == currentIndex;
    final color = isSelected ? Theme.of(context).primaryColor: Colors.grey;
    Color? colorText ;//= isSelected ? AppColors.color4 : Colors.grey;
    Color? color2;// = isSelected ? AppColors.color4 : Colors.transparent;// Customize the text color
    //final fontSize = isSelected ? 18.0 : 16.0; // Customize the text size

    switch(currentIndex){
      case 0 : {
        color2 = isSelected? AppColors.color4:Colors.transparent;
        colorText = isSelected? AppColors.color4:Colors.grey;
      }
      case 1 : {
        color2 = isSelected? AppColors.green1:Colors.transparent;
        colorText = isSelected? AppColors.green1:Colors.grey;
      }
      case 2 : {
        color2 = isSelected? Colors.brown :Colors.transparent;
        colorText = isSelected? Colors.brown:Colors.grey;
      }
    }

    return Expanded(
        child: GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(40)
            ),
            padding: const EdgeInsets.only(left: 12,right: 12,top: 4,bottom: 4),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: colorText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ));
  }
}


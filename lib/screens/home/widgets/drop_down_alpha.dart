import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class DropdownAlpha extends StatefulWidget {
  const DropdownAlpha({super.key});

  @override
  _DropdownAlphaState createState() => _DropdownAlphaState();
}

class _DropdownAlphaState extends State<DropdownAlpha> {
  List<String> items = ['Today', 'This Week', 'This Month'];
  String selectedItem = 'Today';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDropdownButton(
          value: selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue!;
            });
          },
          items: items.map<CustomDropdownMenuItem<String>>((String item) {
            return CustomDropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 13.0, color: Colors.white),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class CustomDropdownButton<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T?> onChanged;
  final List<CustomDropdownMenuItem<T>> items;

  const CustomDropdownButton({super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), // Adjust the radius here
        color: AppColors.color4,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.color4, // Background color of the dropdown menu
          buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown: true,
            padding: const EdgeInsets.all(4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            highlightColor: Colors.black,
            splashColor: Colors.white,
            minWidth: 0,
            height: 0,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            onChanged: onChanged,
            items: items,
          ),
        ),
      ),
    );
  }
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  const CustomDropdownMenuItem({super.key,
    required T value,
    required Widget child,
  }) : super(
    value: value,
    child: child,
  );
}

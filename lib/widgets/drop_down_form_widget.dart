import 'package:flutter/material.dart';

class DropDownFormWidget extends StatelessWidget {
  final Function? onChanged;
  final Color color;
  final double radius;
  bool filled;
  final String selectedValue;
  final List<DropdownMenuItem> dropdownItems;

  //final double? borderSideWidth;

  DropDownFormWidget(
      {required this.onChanged,
      required this.color,
      required this.radius,
      required this.filled,
      required this.selectedValue,
      required this.dropdownItems,
      // this.borderSideWidth,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(radius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(radius),
        ),
        filled: filled,
        fillColor: color,
      ),
      dropdownColor: color,
      value: selectedValue,
      onChanged: (value) => onChanged!(value),
      items: dropdownItems,
    );
  }
}

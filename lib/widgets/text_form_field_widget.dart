import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final int? max;
  final TextInputType? keyboardType;
  //bool? obscureText;
  final Color? color;
  final IconData? icon;
  final Function? validator;
  final Function? onSaved;

  const TextFormFieldWidget({
    this.controller,
    this.hintText,
    required this.labelText,
    this.max,
    //this.obscureText,
    this.color,
    this.icon,
    this.keyboardType,
    this.validator,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        label: Text(labelText),
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5)),
        focusedBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
        // prefixIcon: Icon(
        //   Icons.person,
        //   color: Colors.amber,
        // )
      ),
      //obscureText: obscureText = false,
      maxLength: max,
      validator: (input) => validator!(input),
      onSaved: (value) => onSaved!(value),
    );
  }
}

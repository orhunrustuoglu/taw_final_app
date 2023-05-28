import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hintText;
  final TextInputType textInputType;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.iconData,
      required this.hintText,
      this.textInputType = TextInputType.name});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(iconData),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

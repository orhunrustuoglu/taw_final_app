import 'package:flutter/material.dart';
import 'package:taw_final_app/data/constants/constant_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double verticalPadding;
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.verticalPadding = 20});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed == null ? null : () => onPressed!(),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ));
  }
}

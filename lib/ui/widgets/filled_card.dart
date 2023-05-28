import 'package:flutter/material.dart';
import '/data/constants/constant_colors.dart';

class FilledCard extends StatelessWidget {
  final Color color;
  final String title;
  final Widget content;
  final double height, width;

  const FilledCard(
      {super.key,
      required this.color,
      required this.title,
      required this.content,
      this.height = 0,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == 0 ? null : height,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //push texts to top and bottom
          crossAxisAlignment: CrossAxisAlignment.start, //align texts to left
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: primaryColor),
            ),
            content
          ]),
    );
  }
}

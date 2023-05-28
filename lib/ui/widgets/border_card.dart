import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  final Color borderColor;
  final String title;
  final Widget content;
  final double height, width;
  const BorderCard(
      {super.key,
      required this.borderColor,
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
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //push texts to top and bottom
          crossAxisAlignment: CrossAxisAlignment.start, //align texts to left
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            content
          ]),
    );
  }
}

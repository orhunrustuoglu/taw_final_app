import 'package:flutter/material.dart';

class CostTypeCard extends StatelessWidget {
  final String typeTitle;
  final Color color;
  final Function onTap;
  const CostTypeCard({
    super.key,
    required this.typeTitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(color: color, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            typeTitle,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taw_final_app/data/constants/constant_colors.dart';
import 'package:taw_final_app/data/models/cost.dart';
import 'package:taw_final_app/data/models/cost_type_enum.dart';

class CostCard extends StatelessWidget {
  final Cost cost;
  const CostCard({super.key, required this.cost});

  @override
  Widget build(BuildContext context) {
    var leadingImg = "💳";
    if (cost.costType == CostType.expense) leadingImg = "💲";

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          leading: Text(
            leadingImg,
            style: const TextStyle(fontSize: 24),
          ),
          title: Text(
            cost.description,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: cost.sumOfMoney.toStringAsFixed(2),
              style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const TextSpan(
              text: " ₺",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ]))),
    );
  }
}

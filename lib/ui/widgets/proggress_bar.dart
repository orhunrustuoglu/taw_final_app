import 'package:flutter/material.dart';
import '/data/constants/constant_colors.dart';
import '/data/models/budget.dart';

class ProgressBar extends StatelessWidget {
  final Budget budget;
  const ProgressBar({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //aligns text to the left
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: (budget.totalMoney - (budget.spendings + budget.expenses))
                    .toStringAsFixed(2),
                style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const TextSpan(
                text: "  ₺",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ])),
            const Spacer(),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: budget.totalMoney.toStringAsFixed(2),
                style: const TextStyle(color: primaryColor, fontSize: 18),
              ),
              const TextSpan(
                text: "  ₺",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ])),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 1 -
                      ((budget.spendings + budget.expenses) /
                          budget.totalMoney),
                  minHeight: 10,
                  backgroundColor: accentColor,
                  color: primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  //remaining budget percentage
                  "%${((1 - ((budget.spendings + budget.expenses) / budget.totalMoney)) * 100).toStringAsFixed(0)}"),
            )
          ],
        )
      ],
    );
  }
}

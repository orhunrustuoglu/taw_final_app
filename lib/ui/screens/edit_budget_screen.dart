import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_final_app/data/models/budget.dart';

import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/widgets/custom_button.dart';
import 'package:taw_final_app/ui/widgets/custom_textfield.dart';

class EditBudgetScreen extends StatelessWidget {
  const EditBudgetScreen({super.key});
  static const routeName = "edit-budget-screen";

  @override
  Widget build(BuildContext context) {
    var totalBudgetController = TextEditingController(
        text: Provider.of<BudgetProvider>(context, listen: false)
            .getBudget
            .totalMoney
            .toStringAsFixed(2));

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Budget 💰",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: totalBudgetController,
              iconData: Icons.money_rounded,
              hintText: "Total Budget",
              textInputType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const Spacer(),
            SafeArea(
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                    text: "Save&Close",
                    //have to check whether the total there is a budget entered or not
                    onPressed: () {
                      //update total budget
                      var budgetProvider =
                          Provider.of<BudgetProvider>(context, listen: false);
                      budgetProvider.setTotalBudget(Budget(
                          id: budgetProvider.getBudget.id,
                          userId: budgetProvider.getBudget.userId,
                          totalMoney: double.parse(totalBudgetController.text),
                          spendings: budgetProvider.getBudget.spendings,
                          expenses: budgetProvider.getBudget.expenses,
                          costs: budgetProvider.getBudget.costs));

                      //then, close the screen
                      Navigator.pop(context);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

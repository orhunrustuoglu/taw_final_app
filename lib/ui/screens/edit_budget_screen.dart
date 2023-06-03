import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_final_app/data/models/budget.dart';
import 'package:taw_final_app/ui/providers/auth_provider.dart';

import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/widgets/custom_button.dart';
import 'package:taw_final_app/ui/widgets/custom_textfield.dart';

class EditBudgetScreen extends StatefulWidget {
  const EditBudgetScreen({super.key});
  static const routeName = "edit-budget-screen";

  @override
  State<EditBudgetScreen> createState() => _EditBudgetScreenState();
}

class _EditBudgetScreenState extends State<EditBudgetScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var totalBudgetController = TextEditingController(
        //set the current budget as default value
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
                    isLoading: isLoading,
                    text: "Save&Close",
                    //have to check whether the total there is a budget entered or not
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      var budgetProvider =
                          Provider.of<BudgetProvider>(context, listen: false);
                      var authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      //if there is not any previous budget data
                      if (budgetProvider.getBudget.totalMoney == 0) {
                        budgetProvider.setBudget(
                          Budget(
                              userId: authProvider.getUser.id,
                              totalMoney: double.parse(
                                  totalBudgetController.text), //the new value
                              costs: []),
                          authProvider.getUser,
                          authProvider.getIdToken,
                        );
                      }
                      //if there is previous budget data
                      var tempBudget = budgetProvider.getBudget;
                      tempBudget.totalMoney = double.parse(totalBudgetController
                          .text); //update existing budget's totalMoney
                      budgetProvider.updateBudget(tempBudget,
                          authProvider.getUser, authProvider.getIdToken);

                      setState(() {
                        isLoading = false;
                      });
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:taw_final_app/data/constants/constant_images.dart';
import 'package:taw_final_app/ui/providers/auth_provider.dart';
import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/screens/add_cost_screen.dart';
import 'package:taw_final_app/ui/screens/edit_budget_screen.dart';
import 'package:taw_final_app/ui/widgets/cost_card.dart';
import 'package:taw_final_app/ui/widgets/custom_button.dart';
import '/data/constants/constant_colors.dart';
import '/ui/widgets/border_card.dart';
import '/ui/widgets/filled_card.dart';
import '/ui/widgets/proggress_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = "main-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<AuthProvider>(builder: (context, authProvider, _) {
          return Text("Hello ${authProvider.getUser.fullName} 👋");
        }),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditBudgetScreen.routeName),
              icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            FilledCard(
                height: 120,
                color: secondaryColor,
                title: "Remaining Budget",
                content: Consumer<BudgetProvider>(
                    builder: (context, budgetProvider, _) {
                  if (budgetProvider.getBudget.totalMoney == 0) {
                    return Center(
                      child: CustomButton(
                          verticalPadding: 10,
                          text: "Enter Budget",
                          onPressed: () => Navigator.pushNamed(
                              context, EditBudgetScreen.routeName)),
                    );
                  }
                  return ProgressBar(
                    budget: budgetProvider.getBudget,
                  );
                })),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: FilledCard(
                    height: 120,
                    color: accentColor,
                    title: "Expenses",
                    content: Consumer<BudgetProvider>(
                        builder: (context, budgetProvider, _) {
                      return RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: budgetProvider.getBudget.expenses
                              .toStringAsFixed(2),
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const TextSpan(
                          text: "  ₺",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ]));
                    }),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BorderCard(
                    height: 120,
                    borderColor: accentColor,
                    title: "Spendings",
                    content: Consumer<BudgetProvider>(
                        builder: (context, budgetProvider, _) {
                      return RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: budgetProvider.getBudget.spendings
                              .toStringAsFixed(2),
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const TextSpan(
                          text: "  ₺",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ]));
                    }),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Consumer<BudgetProvider>(builder: (context, budgetProvider, _) {
              if (budgetProvider.getBudget.costs.isEmpty) {
                return const Expanded(
                    child: Center(
                  child: Text(
                    "No cost history exists...",
                    style: TextStyle(color: accentColor),
                  ),
                ));
              }
              return Column(
                children: budgetProvider.getBudget.costs
                    .map((c) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CostCard(cost: c),
                        ))
                    .toList(),
              );
            })
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<BudgetProvider>(
              builder: (context, budgetProvider, _) => CustomButton(
                  text: "Add Cost",
                  //have to check whether the total there is a budget entered or not
                  onPressed: budgetProvider.getBudget.totalMoney == 0
                      ?
                      //if no previous budget data exists
                      null
                      :
                      //if a previous budget data exists
                      //no named routes to get bottom-to-top animation
                      () => Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return const AddCostScreen();
                              },
                            ),
                          )),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_final_app/data/constants/constant_colors.dart';
import 'package:taw_final_app/data/models/cost.dart';
import 'package:taw_final_app/data/models/cost_type_enum.dart';
import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/widgets/cost_type_card.dart';
import 'package:taw_final_app/ui/widgets/custom_button.dart';
import 'package:taw_final_app/ui/widgets/custom_textfield.dart';

class AddCostScreen extends StatefulWidget {
  const AddCostScreen({super.key});
  static const routeName = "add-cost-screen";

  @override
  State<AddCostScreen> createState() => _AddCostScreenState();
}

class _AddCostScreenState extends State<AddCostScreen> {
  var descController = TextEditingController();
  var costController = TextEditingController();
  var costType = CostType.expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Cost 💰",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: descController,
              iconData: Icons.description_rounded,
              hintText: "Description",
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: costController,
              iconData: Icons.money_rounded,
              hintText: "Cost",
              textInputType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: CostTypeCard(
                    typeTitle: "💲 Expense",
                    color: costType == CostType.expense
                        ? secondaryColor
                        : Colors.transparent,
                    onTap: () => setState(() => costType = CostType.expense)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CostTypeCard(
                    typeTitle: "💳 Spending",
                    color: costType == CostType.spending
                        ? secondaryColor
                        : Colors.transparent,
                    onTap: () => setState(() => costType = CostType.spending)),
              ),
            ]),
            const Spacer(),
            SafeArea(
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                    text: "Save&Close",
                    onPressed: () {
                      //first, send to backend
                      Provider.of<BudgetProvider>(context, listen: false)
                          .addCost(Cost(
                              id: "",
                              budgetId: "",
                              costType: costType,
                              description: descController.text,
                              sumOfMoney: double.parse(costController.text)));
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

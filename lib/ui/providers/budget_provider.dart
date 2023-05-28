import 'package:flutter/material.dart';
import 'package:taw_final_app/data/models/budget.dart';
import 'package:taw_final_app/data/models/cost.dart';
import 'package:taw_final_app/data/models/cost_type_enum.dart';
import 'package:taw_final_app/data/repositories/budget_repository.dart';

class BudgetProvider with ChangeNotifier {
  var _budget = Budget(
    id: "",
    userId: "",
    totalMoney: 0,
    costs: [],
  );

  Budget get getBudget => _budget;

  var budgetRepository = BudgetRepository();

  Future<void> getBudgetData() async {
    _budget = await budgetRepository.getBudgetData();
    notifyListeners();
  }

  Future<void> setTotalBudget(Budget budget) async {
    //set the new state to the backend
    await budgetRepository.setTotalBudget(budget);

    //TODO remove below code (2 lines) when backend connected
    _budget = budget;
    notifyListeners();

    //TODO uncomment when backend connected
    //get the new state from the backend,
    //so its guarantee there is only one state
    //getBudgetData();
  }

  Future<void> addCost(Cost cost) async {
    //update the backend
    //await budgetRepository.addCost(cost); //TODO uncomment when backend connected

    //TODO remove when backend connected
    _budget = Budget(
        id: _budget.id,
        userId: _budget.userId,
        totalMoney: _budget.totalMoney,
        expenses: cost.costType == CostType.expense
            ? (_budget.expenses + cost.sumOfMoney)
            : _budget.expenses,
        spendings: cost.costType == CostType.spending
            ? (_budget.spendings + cost.sumOfMoney)
            : _budget.spendings,
        costs: [..._budget.costs, cost]);
    _budget.costs.forEach((element) => print(element.description));

    // _budget.costs.add(cost);
    // if (cost.costType == CostType.expense) {
    //   _budget.expenses += cost.sumOfMoney;
    // } else {
    //   _budget.spendings += cost.sumOfMoney;
    // }
    notifyListeners();

    //get the updated backend
    //getBudgetData();//TODO uncomment when backend connected
  }
}

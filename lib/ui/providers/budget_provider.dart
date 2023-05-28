import 'package:flutter/material.dart';
import 'package:taw_final_app/data/models/budget.dart';
import 'package:taw_final_app/data/repositories/budget_repository.dart';

class BudgetProvider with ChangeNotifier {
  var _budget = Budget(
    id: "",
    userId: "",
    totalMoney: 0,
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
}

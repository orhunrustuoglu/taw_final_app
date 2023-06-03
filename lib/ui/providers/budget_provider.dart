import 'package:flutter/material.dart';
import 'package:taw_final_app/data/models/budget.dart';
import 'package:taw_final_app/data/models/cost.dart';
import 'package:taw_final_app/data/models/cost_type_enum.dart';
import 'package:taw_final_app/data/models/user.dart';
import 'package:taw_final_app/data/repositories/budget_repository.dart';

class BudgetProvider with ChangeNotifier {
  var _budget = Budget(
    userId: "",
    totalMoney: 0,
    costs: [],
  );

  Budget get getBudget => _budget;

  var budgetRepository = BudgetRepository();

  Future<void> getBudgetData(User user, String idToken) async {
    _budget = await budgetRepository.getBudgetData(user, idToken);
    notifyListeners();
  }

  Future<void> setBudget(Budget budget, User user, String idToken) async {
    await budgetRepository.setBudget(budget, user, idToken);
    getBudgetData(user, idToken);
    notifyListeners();
  }

  Future<void> updateBudget(Budget budget, User user, String idToken) async {
    await budgetRepository.updateBudget(budget, user, idToken);
    getBudgetData(user, idToken);
    notifyListeners();
  }

  Future<void> addCost(User user, String idToken, Cost cost) async {
    //update the costs section on backend
    await budgetRepository.addCost(user, idToken, cost);

    //determine the type of cost
    if (cost.costType == CostType.expense) {
      _budget.expenses += cost.sumOfMoney;
    } else {
      _budget.spendings += cost.sumOfMoney;
    }
    //update the total expenses or spendings section on backend
    await budgetRepository.updateBudget(_budget, user, idToken);

    // //get the updated backend
    getBudgetData(user, idToken);
  }
}

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
}

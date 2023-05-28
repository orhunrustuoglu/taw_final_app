import '/data/models/budget.dart';

class BudgetRepository {
  Future<Budget> getBudgetData() async {
    //TODO fetch budget data from db
    return Budget(
      id: "",
      userId: "defaultId",
      totalMoney: 0,
      spendings: 0,
      expenses: 0,
    );
  }

  Future<void> setTotalBudget(Budget budget) async {
    //TODO post total budget data to db
  }
}

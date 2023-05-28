import '/data/models/budget.dart';

class BudgetRepository {
  Future<Budget> getBudgetData() async {
    //TODO fetch budget data from db
    return Budget(
      id: "",
      userId: "defaultId",
      totalMoney: 24000,
      spendings: 6000,
      expenses: 13000,
    );
  }
}

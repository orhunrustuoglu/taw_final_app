class Budget {
  final String id, userId;
  double totalMoney, spendings, expenses;

  Budget(
      {required this.id,
      required this.userId,
      required this.totalMoney,
      this.spendings = 0,
      this.expenses = 0});

  factory Budget.fromJson(Map json) => Budget(
      id: json["localId"],
      userId: json["userId"],
      totalMoney: double.parse(json["totalMoney"]),
      spendings: double.parse(json["totalSpent"]),
      expenses: double.parse(json["expenses"]));

  Map toJson(Budget budget) => {
        "localId": budget.id,
        "userId": budget.userId,
        "totalMoney": budget.totalMoney,
        "totalSpent": budget.spendings,
        "expenses": budget.expenses
      };
}

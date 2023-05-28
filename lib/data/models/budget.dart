import '/data/models/cost.dart';

class Budget {
  final String id, userId;
  double totalMoney, spendings, expenses;
  List<Cost> costs;

  Budget(
      {required this.id,
      required this.userId,
      required this.totalMoney,
      this.spendings = 0,
      this.expenses = 0,
      required this.costs});

  factory Budget.fromJson(Map json) {
    var costsJson = json["costs"] as List;
    return Budget(
      id: json["localId"],
      userId: json["userId"],
      totalMoney: double.parse(json["totalMoney"]),
      spendings: double.parse(json["totalSpent"]),
      expenses: double.parse(json["expenses"]),
      costs: costsJson.map((m) => Cost.fromJson(m)).toList(),
    );
  }
}

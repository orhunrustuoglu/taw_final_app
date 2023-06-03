import 'package:taw_final_app/data/models/cost_type_enum.dart';

import '/data/models/cost.dart';

class Budget {
  final String userId;
  num totalMoney, spendings, expenses;
  List<Cost> costs;

  Budget(
      {required this.userId,
      required this.totalMoney,
      this.spendings = 0,
      this.expenses = 0,
      required this.costs});

  factory Budget.fromJson(Map json) {
    //
    //first, convert map data to a list
    var costsList = <Cost>[];

    if (json["costs"] != null) {
      (json["costs"]).forEach((k, v) {
        //parse the String value of cost type data
        var costType = CostType.expense;
        if (v["costType"] == "CostType.spending") {
          costType = CostType.spending;
        }
        //lastly, add the final Cost object to the list
        costsList.add(Cost(
            id: k,
            budgetId: v["budgetId"],
            costType: costType,
            description: v["description"],
            sumOfMoney: v["sumOfMoney"]));
      });
    }

    return Budget(
        userId: json["userId"] ?? "",
        totalMoney: json["totalMoney"] ?? 0,
        spendings: json["spendings"] ?? 0,
        expenses: json["expenses"] ?? 0,
        costs: costsList);
  }
  Map toJson(Budget budget, String userId) => {
        "userId": userId,
        "totalMoney": budget.totalMoney,
        "spendings": budget.spendings,
        "expenses": budget.expenses,
        "costs": budget.costs
      };
}

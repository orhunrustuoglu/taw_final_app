import '/data/models/cost_type_enum.dart';

class Cost {
  final String id, budgetId, description;
  final CostType costType;
  final double sumOfMoney;

  Cost({
    required this.id,
    required this.budgetId,
    this.costType = CostType.spending,
    required this.description,
    required this.sumOfMoney,
  });

  factory Cost.fromJson(Map json) => Cost(
        id: json["budgetId"],
        budgetId: json["budgetId"],
        costType: json["costType"] as CostType,
        description: json["description"],
        sumOfMoney: json["sumOfMoney"],
      );

  Map toJson(Cost cost) => {
        "localId": cost.id,
        "budgetId": cost.budgetId,
        "costType": cost.costType.toString(),
        "description": cost.description,
        "sumOfMoney": cost.sumOfMoney,
      };
}

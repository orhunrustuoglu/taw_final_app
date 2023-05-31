import 'dart:convert';

import 'package:taw_final_app/data/models/user.dart';

import '../constants/server_constants.dart';
import '../models/cost.dart';
import '/data/models/budget.dart';
import 'package:http/http.dart' as http;

class BudgetRepository {
  Future<Budget> getBudgetData() async {
    //TODO fetch budget data from db
    return Budget(
        id: "",
        userId: "defaultId",
        totalMoney: 0,
        spendings: 0,
        expenses: 0,
        costs: []);
  }

  Future<Budget> setBudget(Budget budget, User user, String idToken) async {
    var url = Uri.parse("$serverUrl/budgets/${user.id}.json");
    var response = await http.put(url,
        headers: {
          "idToken": idToken,
          "Content-Type": "application/json",
        },
        body: json.encode({
          "id": budget.id,
          "userId": user.id,
          "totalMoney": budget.totalMoney,
          "spendings": budget.spendings,
          "expenses": budget.expenses,
          "costs": budget.costs
        }));
    print(idToken);
    if (response.statusCode == 200) {
      return Budget.fromJson(json.decode(response.body));
    }
    return Budget(
        id: "",
        userId: "defaultId",
        totalMoney: 0,
        spendings: 0,
        expenses: 0,
        costs: []);
  }

  Future<void> addCost(Cost cost) async {
    //TODO add cost to backend
  }
}

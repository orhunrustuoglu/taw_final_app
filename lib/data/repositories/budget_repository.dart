import 'dart:convert';

import 'package:taw_final_app/data/models/user.dart';

import '../constants/server_constants.dart';
import '../models/cost.dart';
import '/data/models/budget.dart';
import 'package:http/http.dart' as http;

class BudgetRepository {
  Future<Budget> getBudgetData(User user, String idToken) async {
    var url = Uri.parse("$serverUrl/budgets/${user.id}.json?auth=$idToken");

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return Budget.fromJson(json.decode(response.body));
    }

    return Budget(
        userId: "undefined",
        totalMoney: 0,
        spendings: 0,
        expenses: 0,
        costs: []);
  }

  Future<void> setBudget(Budget budget, User user, String idToken) async {
    var url = Uri.parse("$serverUrl/budgets/${user.id}.json?auth=$idToken");
    await http.put(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(budget.toJson(budget, user.id)));
  }

  Future<void> updateBudget(Budget budget, User user, String idToken) async {
    var url = Uri.parse("$serverUrl/budgets/${user.id}.json?auth=$idToken");
    // var response =
    await http.patch(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "totalMoney": budget.totalMoney,
          "expenses": budget.expenses,
          "spendings": budget.spendings,
        }));
  }

  Future<void> addCost(User user, String idToken, Cost cost) async {
    var url =
        Uri.parse("$serverUrl/budgets/${user.id}/costs/.json?auth=$idToken");
    await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(cost.toJson(cost)));
  }
}

import 'package:flutter/material.dart';
import '/data/models/user.dart';
import '/data/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  var _user = User(id: "", fullName: "", email: "");

  User get getUser => _user;

  var authRepository = AuthRepository();

  Future<void> getUserData() async {
    _user = await authRepository.getUserData();
    notifyListeners();
  }
}

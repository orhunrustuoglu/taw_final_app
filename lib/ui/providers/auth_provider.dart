import 'package:flutter/material.dart';
import 'package:taw_final_app/data/models/user_response.dart';
import 'package:taw_final_app/data/repositories/snackbar_repository.dart';
import '../screens/main_screen.dart';
import '/data/models/user.dart';
import '/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  var _user = User(id: "", fullName: "", email: "");
  var _userResponse =
      UserResponse(localId: "", email: "", displayName: "", idToken: "");
  String _idToken = "";

  User get getUser => _user;
  UserResponse get getUserResponse => _userResponse;
  String get getIdToken => _idToken;

  var authRepository = AuthRepository();

  Future<void> signInWithToken() async {
    _user = await authRepository.signInWithToken(_idToken);
    notifyListeners();
  }

  // Future<void> signUp(User user, String email, password) async {
  //   _user = await authRepository.signUp(email, password);
  //   createUserInDb(user);
  // }

  // Future<void> createUserInDb(User user) async {
  //   await authRepository.createUserInDb(user, _idToken);
  //   await getUserData(_userResponse);
  // }

  Future<void> retrieveToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _idToken = prefs.getString("idToken")!;
    notifyListeners();
  }

  Future<void> logInEmailPassword(
      BuildContext context, String email, password) async {
    UserResponse userResponse =
        await authRepository.logInEmailPassword(email, password);

    //if success
    if (userResponse.localId != "") {
      _userResponse = userResponse;
      notifyListeners();
      await getUserData(userResponse);
      Future.delayed(Duration.zero,
          () => Navigator.pushReplacementNamed(context, MainScreen.routeName));
      return;
    }

    //if failed, inform the user that something went wrong
    Future.delayed(
        Duration.zero, () => SnackbarRepository().showFailedSnackbar(context));
    notifyListeners();
  }

  Future<void> getUserData(UserResponse userResponse) async {
    _user = await authRepository.getUserData(userResponse);
    notifyListeners();
  }
}

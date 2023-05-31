import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taw_final_app/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:taw_final_app/data/models/user_response.dart';

import '../constants/server_constants.dart';

class AuthRepository {
  //Google Auth Rest API documentation:
  //https://firebase.google.com/docs/reference/rest/auth#section-sign-in-email-password

  Future<User> signInWithToken(String idToken) async {
    var url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=$webApiKey");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "requestUri":
                "https://taw-final-app-default-rtdb.europe-west1.firebasedatabase.app/",
            "idToken": idToken,
          },
        ));
    print(response.body);

    //if success
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }
    return User(id: "", fullName: "", email: "");
  }

  Future<User> signUp(String email, password) async {
    //TODO sign up to the Firebase backend
    //TODO return proper user
    return User(id: "id", fullName: "fullName", email: email);
  }

  // Future<void> createUserInDb(User user, String idToken) async {
  //   var url = Uri.parse("$serverUrl/users/${user.id}.json?access_token=${userResponse.idToken}");
  //   var response = await http.put(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: json.encode(user.toJson(user)));
  //   if (response.statusCode == 200) {}
  // }

  Future<User> getUserData(UserResponse userResponse) async {
    var url = Uri.parse(
        "$serverUrl/users/${userResponse.localId}.json?auth=${userResponse.idToken}");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.body);

    //if successed
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    //if failed
    return User(
      id: "undefined",
      fullName: "undefined",
      email: "undefined",
    );
  }

  Future<UserResponse> logInEmailPassword(String email, password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$webApiKey");

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    //if success
    if (response.statusCode == 200) {
      var userResponse = UserResponse.fromJson(json.decode(response.body));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("idToken", userResponse.idToken);
      //return userResponse
      return userResponse;
    }
    //if failed
    return UserResponse(localId: "", email: "", displayName: "", idToken: "");
  }
}

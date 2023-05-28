import 'package:taw_final_app/data/models/user.dart';

class AuthRepository {
  Future<User> getUserData() async {
    //TODO fetch user data from db
    return User(
      id: "defaultId",
      fullName: "John Doe",
      email: "ss@ss.com",
    );
  }
}

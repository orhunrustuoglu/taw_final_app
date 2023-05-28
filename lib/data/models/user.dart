class User {
  final String id, email, fullName;

  User({required this.id, required this.fullName, required this.email});

  factory User.fromJson(Map json) => User(
        id: json["localId"],
        fullName: json["fullName"],
        email: json["email"],
      );

  Map toJson(User user) =>
      {"localId": user.id, "fullName": user.fullName, "email": user.email};
}

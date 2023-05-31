class UserResponse {
  final String localId, email, displayName, idToken;
  UserResponse({
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
  });

  factory UserResponse.fromJson(Map json) {
    return UserResponse(
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"]);
  }
}

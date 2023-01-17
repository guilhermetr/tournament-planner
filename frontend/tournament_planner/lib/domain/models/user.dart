class User {
  const User({
    required this.id,
    required this.username,
  });

  final int id;
  final String username;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
    };
  }

  User fromJson(dynamic jsonData) {
    return User(id: jsonData["id"], username: jsonData["username"]);
  }
}

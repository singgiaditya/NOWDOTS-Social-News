class UserModel {
  final String name;
  final String username;
  final String score;
  final String picture;
  final bool isVerified;

  UserModel(
      {required this.name,
      required this.username,
      required this.score,
      required this.picture,
      required this.isVerified});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      score: json['score'] ?? "",
      picture: json['picture'] ?? "",
      isVerified: json['isVerified'] ?? "",
    );
  }
}

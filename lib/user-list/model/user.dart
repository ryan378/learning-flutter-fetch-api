class User {
  final int userID;
  final int id;
  final String title;
  final String body;

  const User({
    required this.id,
    required this.userID,
    required this.title,
    required this.body,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userID: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

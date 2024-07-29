class User {
  String userId;
  String? username;
  bool isReview;

  User({required this.userId, this.username, required this.isReview});

  factory User.fromMap(Map<String, dynamic> data, String userId) {
    return User(
      userId: userId,
      username: data['username'],
      isReview: data['isReview'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'isReview': isReview,
    };
  }
}
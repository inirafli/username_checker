/// User model representing a user in the Firestore 'users' collection.
///
/// The [User] model includes the following fields:
/// - [userId]: The document ID of the user.
/// - [username]: The username of the user.
/// - [isReview]: A boolean indicating if the user's profile is under review.
class User {
  String userId;
  String username;
  bool isReview;

  User({required this.userId, required this.username, required this.isReview});

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
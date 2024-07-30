import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

import '../models/user_model.dart';

/// A helper class for interacting with Firestore.
class FirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Checks if a username is available.
  ///
  /// Queries the 'users' collection to see if any document has the provided username.
  Future<bool> checkUsernameAvailability(String username) async {
    try {
      QuerySnapshot result = await _firestore.collection('users')
          .where('username', isEqualTo: username)
          .get();
      return result.docs.isEmpty;
    } catch (e) {
      developer.log('$e', name: 'checkUsernameAvailability Error');
      return false;
    }
  }

  /// Checks if a user can change their username.
  ///
  /// Queries the 'users' collection to find the document with the provided username.
  /// If found, checks the 'isReview' field to determine if the username can be changed.
  Future<bool> canChangeUsername(String username) async {
    try {
      QuerySnapshot result = await _firestore.collection('users')
          .where('username', isEqualTo: username)
          .get();
      if (result.docs.isNotEmpty) {
        User user = User.fromMap(result.docs.first.data() as Map<String, dynamic>, result.docs.first.id);
        return user.isReview;
      }
      return false;
    } catch (e) {
      developer.log('$e', name: 'canChangeUsername Error');
      return false;
    }
  }
}
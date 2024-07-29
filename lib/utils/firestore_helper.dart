import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

import '../models/user_model.dart';

class FirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkUsernameAvailability(String username) async {
    try {
      QuerySnapshot result = await _firestore.collection('users')
          .where('username', isEqualTo: username)
          .get();
      return result.docs.isEmpty;
    } catch (e) {
      developer.log('$e', name: 'checkUsernameAvailability');
      return false;
    }
  }

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
      developer.log('$e', name: 'canChangeUsername');
      return false;
    }
  }
}
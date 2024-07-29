import 'package:get/get.dart';

import '../utils/firestore_helper.dart';

class UsernameController extends GetxController {
  var username = ''.obs;
  var isUsernameAvailable = false.obs;
  var isUsernameChangeable = false.obs;
  var profileStatus = 'Incomplete'.obs;
  var isLoading = false.obs;

  var isAlphanumeric = false.obs;
  var isMinLength = false.obs;

  final FirestoreHelper _firestoreHelper = FirestoreHelper();

  void validateUsername(String input) {
    // Check for alphanumeric characters
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    isAlphanumeric.value = validCharacters.hasMatch(input);

    // Check for minimum length
    isMinLength.value = input.length >= 8;

    username.value = input;

    // Set profile status
    profileStatus.value = input.isEmpty ? 'Incomplete' : 'Complete';

    if (input.isNotEmpty) {
      checkUsernameAvailability(input);
    }
  }

  void checkUsernameAvailability(String username) async {
    isLoading.value = true;
    isUsernameAvailable.value = await _firestoreHelper.checkUsernameAvailability(username);

    if (!isUsernameAvailable.value) {
      isUsernameChangeable.value = await _firestoreHelper.canChangeUsername(username);
    }

    isLoading.value = false;
  }
}
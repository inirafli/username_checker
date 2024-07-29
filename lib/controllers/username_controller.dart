import 'package:flutter/material.dart';
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
  var showAvailability = false.obs;

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

    // Reset showAvailability when the input changes
    showAvailability.value = false;
  }

  void checkUsername() async {
    isLoading.value = true;
    isUsernameAvailable.value = await _firestoreHelper.checkUsernameAvailability(username.value);

    if (!isUsernameAvailable.value) {
      isUsernameChangeable.value =
      await _firestoreHelper.canChangeUsername(username.value);
    }

    showAvailability.value = true;
    isLoading.value = false;
  }

  // Methods to get the validation message text
  String get profileStatusText => 'Profile Status: ${profileStatus.value}';
  String get alphanumericValidationText => 'Use characters and numbers only';
  String get minLengthValidationText => 'Minimum 8 characters';
  String get usernameAvailabilityText => isUsernameAvailable.value ? 'This Username is available' : 'This Username is not available';
  String get usernameChangeabilityText => isUsernameChangeable.value ? 'You can change your username' : 'You can\'t change your username';

  // Methods to get the validation message color
  Color getProfileStatusColor() => profileStatus.value == 'Incomplete' ? Colors.grey : Colors.black;
  Color getAlphanumericValidationColor() => username.isEmpty ? Colors.grey : (isAlphanumeric.value ? Colors.green : Colors.red);
  Color getMinLengthValidationColor() => username.isEmpty ? Colors.grey : (isMinLength.value ? Colors.green : Colors.red);
  Color getUsernameAvailabilityColor() => username.isEmpty ? Colors.grey : (isUsernameAvailable.value ? Colors.green : Colors.red);
  Color getUsernameChangeabilityColor() => username.isEmpty ? Colors.grey : (isUsernameChangeable.value ? Colors.green : Colors.red);

  // Method to get the appropriate icon for each validation state
  IconData getValidationIcon(bool isValid, {bool? isEmpty}) {
    if (isEmpty ?? username.isEmpty) {
      return Icons.circle;
    }
    return isValid ? Icons.check_circle : Icons.cancel;
  }

  // Method to determine if the button should be enabled
  bool isButtonEnabled() {
    return isAlphanumeric.value && isMinLength.value && profileStatus.value == 'Complete' && !isLoading.value;
  }
}
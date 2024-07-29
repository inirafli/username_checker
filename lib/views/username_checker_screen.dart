import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:username_checker/controllers/username_controller.dart';

import '../widgets/validation_messages.dart';

class UsernameCheckerScreen extends StatelessWidget {
  final UsernameController _controller = Get.put(UsernameController());

  UsernameCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => _controller.validateUsername(value),
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(() => ValidationMessageRow(
              text: _controller.profileStatusText,
              isValid: _controller.profileStatus.value == 'Complete',
              color: _controller.getProfileStatusColor(),
            )),
            const SizedBox(height: 8.0),
            Obx(() => ValidationMessageRow(
              text: _controller.alphanumericValidationText,
              isValid: _controller.isAlphanumeric.value,
              color: _controller.getAlphanumericValidationColor(),
            )),
            Obx(() => ValidationMessageRow(
              text: _controller.minLengthValidationText,
              isValid: _controller.isMinLength.value,
              color: _controller.getMinLengthValidationColor(),
            )),
            const SizedBox(height: 16.0),
            Obx(() => _controller.showAvailability.value
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValidationMessageRow(
                  text: _controller.usernameAvailabilityText,
                  isValid: _controller.isUsernameAvailable.value,
                  color: _controller.getUsernameAvailabilityColor(),
                ),
                if (!_controller.isUsernameAvailable.value)
                  ValidationMessageRow(
                    text: _controller.usernameChangeabilityText,
                    isValid: _controller.isUsernameChangeable.value,
                    color: _controller.getUsernameChangeabilityColor(),
                  ),
              ],
            )
                : Container()),
            const SizedBox(height: 16.0),
            Obx(() => ElevatedButton(
              onPressed: _controller.isButtonEnabled() ? () => _controller.checkUsername() : null,
              child: _controller.isLoading.value
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text('Check'),
            )),
          ],
        ),
      ),
    );
  }
}
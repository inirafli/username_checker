import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:username_checker/controllers/username_controller.dart';
import 'package:username_checker/widgets/profile_status.dart';
import 'package:username_checker/widgets/username_text_field.dart';

import '../widgets/validation_messages.dart';

/// The screen for checking and validating usernames.
///
/// This screen uses the UsernameController to manage
/// the username state and validation.
/// The Obx widget is used to reactively update
/// the UI based on the controller's state.
class UsernameCheckerScreen extends StatelessWidget {
  final UsernameController _controller = Get.put(UsernameController());

  UsernameCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.1, 0.3],
          colors: [
            Colors.blue[100]!,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileStatusInfo(),
                  const SizedBox(height: 48.0),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Username Checker',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 48.0),
                        UsernameTextField(),
                        const SizedBox(height: 16.0),
                        Obx(() => ValidationMessages(
                              text: _controller.alphanumericValidationText,
                              isValid: _controller.isAlphanumeric.value,
                              color:
                                  _controller.getAlphanumericValidationColor(),
                            )),
                        const SizedBox(height: 3.0),
                        Obx(() => ValidationMessages(
                              text: _controller.minLengthValidationText,
                              isValid: _controller.isMinLength.value,
                              color: _controller.getMinLengthValidationColor(),
                            )),
                        const SizedBox(height: 3.0),
                        Obx(() => _controller.showAvailability.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ValidationMessages(
                                    text: _controller.usernameAvailabilityText,
                                    isValid:
                                        _controller.isUsernameAvailable.value,
                                    color: _controller
                                        .getUsernameAvailabilityColor(),
                                  ),
                                  const SizedBox(height: 3.0),
                                  if (!_controller.isUsernameAvailable.value)
                                    ValidationMessages(
                                      text:
                                          _controller.usernameChangeabilityText,
                                      isValid: _controller
                                          .isUsernameChangeable.value,
                                      color: _controller
                                          .getUsernameChangeabilityColor(),
                                    ),
                                ],
                              )
                            : const SizedBox.shrink()),
                        const SizedBox(height: 28.0),
                        Obx(() => ElevatedButton(
                              onPressed: _controller.isButtonEnabled()
                                  ? () => _controller.checkUsername()
                                  : null,
                              child: _controller.isLoading.value
                                  ? const Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                    )
                                  : const Text('Confirm'),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

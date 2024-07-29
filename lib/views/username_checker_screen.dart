import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:username_checker/controllers/username_controller.dart';

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
            Obx(() => TextField(
                  onChanged: (value) => _controller.validateUsername(value),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                )),
            const SizedBox(height: 16.0),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Status: ${_controller.profileStatus.value}',
                      style: TextStyle(
                        color: _controller.profileStatus.value == 'Incomplete'
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Use characters and numbers only',
                      style: TextStyle(
                        color: _controller.username.isEmpty
                            ? Colors.grey
                            : (_controller.isAlphanumeric.value
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    Text(
                      'Minimum 8 characters',
                      style: TextStyle(
                        color: _controller.username.isEmpty
                            ? Colors.grey
                            : (_controller.isMinLength.value
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    Text(
                      _controller.isUsernameAvailable.value
                          ? 'This Username is available'
                          : 'This Username is not available',
                      style: TextStyle(
                        color: _controller.username.isEmpty
                            ? Colors.grey
                            : (_controller.isUsernameAvailable.value
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    if (!_controller.isUsernameAvailable.value)
                      Text(
                        _controller.isUsernameChangeable.value
                            ? 'You can change your username'
                            : 'You can\'t change your username',
                        style: TextStyle(
                          color: _controller.username.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

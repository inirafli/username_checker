// views/widgets/username_text_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/username_controller.dart';

class UsernameTextField extends StatelessWidget {
  final UsernameController _controller = Get.find<UsernameController>();

  UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: _controller.textEditingController,
        onChanged: (value) => _controller.validateUsername(value),
        decoration: InputDecoration(
          labelText: 'Input Your Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          suffixIcon: _controller.username.isNotEmpty
              ? IconButton(
                  icon:
                      const Icon(Icons.clear, color: Colors.black, size: 18.0),
                  onPressed: () => _controller.clearUsername(),
                )
              : null,
        ),
      ),
    );
  }
}

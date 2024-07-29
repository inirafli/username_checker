// views/widgets/validation_message_row.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/username_controller.dart';

class ValidationMessages extends StatelessWidget {
  final String text;
  final bool isValid;
  final Color color;

  const ValidationMessages({
    super.key,
    required this.text,
    required this.isValid,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final UsernameController controller = Get.find<UsernameController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          controller.getValidationIcon(isValid),
          color: color,
          size: 20.0,
        ),
        const SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(fontSize: 14.0, color: color),
        ),
      ],
    );
  }
}

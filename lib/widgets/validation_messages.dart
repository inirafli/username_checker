// views/widgets/validation_message_row.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/username_controller.dart';

class ValidationMessageRow extends StatelessWidget {
  final String text;
  final bool isValid;
  final Color color;

  const ValidationMessageRow({
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
          size: 16.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}

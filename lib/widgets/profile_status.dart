// views/widgets/top_row_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/username_controller.dart';

class ProfileStatusInfo extends StatelessWidget {
  final UsernameController _controller = Get.find<UsernameController>();

  ProfileStatusInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ),
        Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: _controller.profileStatus.value == 'Complete'
                ? Colors.green
                : Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile ${_controller.profileStatus.value}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Icon(
                _controller.profileStatus.value == 'Complete'
                    ? Icons.check_circle
                    : Icons.warning_rounded,
                color: Colors.white,
                size: 18.0,
              ),
            ],
          ),
        )),
      ],
    );
  }
}

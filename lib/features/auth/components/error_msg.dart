import 'package:flutter/material.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_text_styles.dart';
import 'background_container.dart';

class ErrorMsg extends StatelessWidget {
  final String message;
  const ErrorMsg({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          const Icon(Icons.error, color: AppColors.black64, size: 18),
          Text(
            message,
            style: AppTextStyles.h6(color: AppColors.black64),
          ),
        ],
      ),
    );
  }
}

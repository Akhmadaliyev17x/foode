import 'package:flutter/material.dart';

import '../constans/app_colors.dart';
import '../constans/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.isActive = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: AppColors.pink84,
      shape: const StadiumBorder(),
      onPressed: isActive ? onPressed : null,
      height: 60,
      minWidth: 320,
      color: AppColors.pink,
      child: Text(
        text,
        style: AppTextStyles.button,
      ),
    );
  }
}

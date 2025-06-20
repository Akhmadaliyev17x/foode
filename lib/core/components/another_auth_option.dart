import 'package:flutter/material.dart';
import 'package:foode/core/constans/app_colors.dart';

import '../constans/app_text_styles.dart';

class AuthOptionButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onPressed;

  const AuthOptionButton({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(150, 65),
        elevation: 8,
        shadowColor: AppColors.black12,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Center(
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 50, child: icon),
            Text(
              title,
              style: AppTextStyles.h5(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foode/features/home/home.dart';

class HeaderTexts extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback? onPressed;
  const HeaderTexts(
      {super.key,
      required this.text,
      required this.buttonText,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.h4(color: AppColors.black),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyles.h5(color: AppColors.pink),
            ),
          ),
        ],
      ),
    );
  }
}

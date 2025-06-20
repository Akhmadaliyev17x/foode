import 'package:flutter/material.dart';

import '../constans/app_colors.dart';
import '../constans/app_text_styles.dart';

class InputLabel extends StatelessWidget {
  final String text;
  const InputLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyles.h5(color: AppColors.black54),
          ),
          Text(
            "*",
            style: AppTextStyles.h5(color: AppColors.pink),
          )
        ],
      ),
    );
  }
}

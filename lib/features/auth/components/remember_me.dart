import 'package:flutter/material.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_text_styles.dart';

class RememberMe extends StatefulWidget {
  final Function(bool) onChanged;
  const RememberMe({super.key, required this.onChanged});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 16),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          value: isSelected,
          onChanged: (a) {
            isSelected = !isSelected;
            widget.onChanged(a ?? false);
            setState(() {});
          },
          activeColor: AppColors.pink,
          checkColor: AppColors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Remember me",
          style: AppTextStyles.h5(color: AppColors.black54),
        ),
        const Spacer()
      ],
    );
  }
}

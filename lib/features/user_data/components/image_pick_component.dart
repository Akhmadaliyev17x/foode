import 'package:flutter/material.dart';

import '../user_data.dart';

class ImagePickComponent extends StatelessWidget {
  final String imgUrl;
  final String subtitle;
  final VoidCallback? onPressed;
  const ImagePickComponent(
      {super.key,
      required this.imgUrl,
      required this.subtitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.black34,
            width: 1.7,
          ),
        ),
        elevation: 5,
        child: SizedBox(
          height: 150,
          width: 300,
          child: Center(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: Image(
                    image: AssetImage(imgUrl),
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.h5(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

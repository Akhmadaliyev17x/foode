import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foode/core/constans/app_colors.dart';
import "package:go_router/go_router.dart";

import '../constans/app_text_styles.dart';

AppBar customAppBar(
        {required BuildContext context,
        required String title,
        VoidCallback? onPressedBackButton,
        bool hasBottom = false}) =>
    AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: false,
      leadingWidth: 60,
      leading: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.pink28,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressedBackButton ??
            () {
              context.pop();
            },
        icon: const Icon(
          CupertinoIcons.back,
          color: AppColors.pink,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.appBar,
      ),
      bottom: hasBottom
          ? Tab(
              height: 50,
              child: SizedBox(
                height: double.maxFinite,
                width: 300,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "This data will be displayed in your account profile for security",
                    style: AppTextStyles.h6(color: AppColors.black),
                  ),
                ),
              ),
            )
          : null,
    );

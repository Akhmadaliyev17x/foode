import 'package:flutter/material.dart';
import 'package:foode/core/components/primary_button.dart';
import 'package:foode/core/constans/app_colors.dart';
import 'package:foode/core/constans/app_text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/sign_in_page/sign_in_page.dart';

class GetStartedPage extends StatelessWidget {
  static const url = "/getstarted";

  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/png/gs_back.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -0.4),
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.transparent,
                    AppColors.gsBlue,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.7),
            child: Column(
              spacing: 18,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Foode",
                  style: AppTextStyles.h1(),
                ),
                const Text(
                  "The best food ordering and delivery app of the century",
                  style: TextStyle(color: AppColors.white),
                ),
                PrimaryButton(
                  text: "Next",
                  onPressed: () {
                    context.go(SignInPage.url);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

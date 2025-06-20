import 'package:flutter/material.dart';
import 'package:foode/core/components/another_auth_option.dart';
import 'package:foode/core/components/custom_input.dart';
import 'package:foode/core/components/input_label.dart';
import 'package:foode/core/components/primary_button.dart';
import 'package:foode/core/constans/app_colors.dart';
import 'package:foode/core/constans/app_icons.dart';
import 'package:foode/core/constans/app_text_styles.dart';
import 'package:foode/features/auth/components/error_msg.dart';
import 'package:foode/features/auth/components/remember_me.dart';
import 'package:foode/features/auth/presentation/sign_up_page/sign_up_page.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  static const url = "/sign_in";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isAgree = false;
  bool isWarning = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: AppIcons.splashIcon,
              ),
              Text(
                "Sign in to your account",
                style: AppTextStyles.h2(color: AppColors.black),
              ),
              const SizedBox(height: 10),
              const InputLabel(text: "Email"),
              CustomTextField(
                onChanged: (a) {
                  if (a.endsWith("@gmail.com")) {
                    isWarning = false;
                    setState(() {});
                  }
                },
                hintText: "Email or Phone Number",
              ),
              const SizedBox(height: 12),
              isWarning
                  ? const ErrorMsg(message: "This is a message")
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              const InputLabel(text: "Password"),
              const CustomTextField(hintText: "Password", isSecret: true),
              const SizedBox(height: 8),
              RememberMe(onChanged: (a) {
                isAgree = a;
                setState(() {});
              }),
              const SizedBox(height: 16),
              PrimaryButton(
                text: "Sign In",
                onPressed: () {},
                isActive: isAgree,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: null,
                child: Text("Forgot the password?",
                    style: AppTextStyles.h5(color: AppColors.pink)),
              ),
              const SizedBox(height: 8),
              const Text("or continue with"),
              const SizedBox(height: 8),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AuthOptionButton(
                        title: "Facebook", icon: AppIcons.facebook),
                    AuthOptionButton(title: "Google", icon: AppIcons.google),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Don't have an account?",
                      style: AppTextStyles.h5(color: AppColors.black54)),
                  TextButton(
                    onPressed: () {
                      context.go(SignUpPage.url);
                    },
                    child: Text(
                      "Sign Up",
                      style: AppTextStyles.h5(color: AppColors.pink),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

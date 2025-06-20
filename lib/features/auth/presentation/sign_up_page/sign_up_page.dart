import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/core/components/another_auth_option.dart';
import 'package:foode/core/components/custom_input.dart';
import 'package:foode/core/components/input_label.dart';
import 'package:foode/core/components/primary_button.dart';
import 'package:foode/features/auth/components/error_msg.dart';
import 'package:foode/features/auth/components/remember_me.dart';

import '../bloc/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  static const url = "/sign_up";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAgree = false;
  String? errorMessage;

  Future<void> handleSignUp() async {
    FocusScope.of(context).unfocus();
    errorMessage = null;

    context.read<AuthBloc>().add(
          AuthSignUpStep1RequestedEvent(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthLoading) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is AuthSignUpStep1Success) {
          context.go(FillBioPage.url);
        } else if (state is AuthFailure) {
          setState(() {
            errorMessage = state.message;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 150, child: AppIcons.splashIcon),
                  Text("Sign up for free",
                      style: AppTextStyles.h2(color: AppColors.black)),
                  const SizedBox(height: 10),
                  const InputLabel(text: "Email"),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email or Phone Number",
                  ),
                  const SizedBox(height: 12),
                  if (errorMessage != null)
                    ErrorMsg(message: "This is a message"),
                  const SizedBox(height: 20),
                  const InputLabel(text: "Password"),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    isSecret: true,
                  ),
                  const SizedBox(height: 8),
                  RememberMe(onChanged: (a) {
                    setState(() {
                      isAgree = a;
                    });
                  }),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: "Sign Up",
                    onPressed: handleSignUp,
                    isActive: isAgree,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
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
                        AuthOptionButton(
                            title: "Google", icon: AppIcons.google),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Already have an account?",
                          style: AppTextStyles.h5(color: AppColors.black54)),
                      TextButton(
                        onPressed: () {
                          context.go(SignInPage.url);
                        },
                        child: Text("Sign In",
                            style: AppTextStyles.h5(color: AppColors.pink)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

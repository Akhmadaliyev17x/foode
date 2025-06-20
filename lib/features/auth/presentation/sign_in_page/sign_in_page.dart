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

class SignInPage extends StatefulWidget {
  static const url = "/sign_in";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isAgree = false;
  bool isWarning = false;
  String? errorMessage;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    FocusScope.of(context).unfocus();
    errorMessage = null;

    context.read<AuthBloc>().add(
          AuthSignInRequestedEvent(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is AuthSignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully Logged in!"),
              backgroundColor: Colors.green,
            ),
          );
          context.go(HomePage.url);
        } else if (state is AuthFailure) {
          setState(() {
            errorMessage = state.message;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 150, child: AppIcons.splashIcon),
                  Text("Sign in to your account",
                      style: AppTextStyles.h2(color: AppColors.black)),
                  const SizedBox(height: 10),
                  const InputLabel(text: "Email"),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email or Phone Number",
                    onChanged: (a) {
                      setState(() {
                        isWarning = !a.endsWith("@gmail.com");
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  if (isWarning)
                    const ErrorMsg(
                        message: "Please enter a valid Gmail address"),
                  if (errorMessage != null)
                    const ErrorMsg(message: "This is a message"),
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
                    text: "Sign In",
                    onPressed: () {
                      context.go(HomePage.url);
                    },
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
                      Text("Don't have an account?",
                          style: AppTextStyles.h5(color: AppColors.black54)),
                      TextButton(
                        onPressed: () {
                          context.go(SignUpPage.url);
                        },
                        child: Text("Sign Up",
                            style: AppTextStyles.h5(color: AppColors.pink)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

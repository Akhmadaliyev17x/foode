import 'package:flutter/material.dart';
import 'package:foode/features/user_data/presentation/payment_method/payment_method_page.dart';
import 'package:go_router/go_router.dart';

import '../../user_data.dart';

class FillBioPage extends StatelessWidget {
  static const url = "${SignUpPage.url}/bio";

  const FillBioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
            context: context, title: "Fill In Your Bio", hasBottom: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                const InputLabel(text: "Full Name"),
                const CustomTextField(hintText: "Enter your name"),
                const SizedBox(height: 8),
                const InputLabel(text: "Nick Name"),
                const CustomTextField(hintText: "Create nickname"),
                const SizedBox(height: 8),
                const InputLabel(text: "Phone number"),
                const CustomTextField(hintText: "Enter your Phone Number"),
                const SizedBox(height: 8),
                const InputLabel(text: "Gender"),
                const CustomDropdown(hintText: "Gender"),
                const SizedBox(height: 8),
                const InputLabel(text: "Date of Birth"),
                const CustomDatePickerField(hintText: "Pick your birthdate"),
                const SizedBox(height: 8),
                const InputLabel(text: "Address"),
                const CustomTextField(hintText: "Enter your home address"),
                const SizedBox(height: 20),
                PrimaryButton(
                    text: "Next",
                    onPressed: () {
                      context.go(PaymentMethodPage.url);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

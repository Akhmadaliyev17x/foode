import 'package:flutter/material.dart';
import 'package:foode/features/user_data/presentation/payment_method/payment_method_page.dart';
import 'package:go_router/go_router.dart';

import '../../user_data.dart';

class FillBioPage extends StatefulWidget {
  static const url = "${SignUpPage.url}/bio";

  const FillBioPage({super.key});

  @override
  State<FillBioPage> createState() => _FillBioPageState();
}

class _FillBioPageState extends State<FillBioPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                CustomTextField(
                  hintText: "Enter your name",
                  controller: fullNameController,
                ),
                const SizedBox(height: 8),
                const InputLabel(text: "Nick Name"),
                CustomTextField(
                  hintText: "Create nickname",
                  controller: nickNameController,
                ),
                const SizedBox(height: 8),
                const InputLabel(text: "Phone number"),
                CustomTextField(
                  hintText: "Enter your Phone Number",
                  controller: phoneController,
                ),
                const SizedBox(height: 8),
                const InputLabel(text: "Gender"),
                CustomDropdown(
                  hintText: "Gender",
                  onChanged: (text) {
                    genderController.text = text;
                  },
                ),
                const SizedBox(height: 8),
                const InputLabel(text: "Date of Birth"),
                const CustomDatePickerField(hintText: "Pick your birthdate"),
                const SizedBox(height: 8),
                const InputLabel(text: "Address"),
                CustomTextField(
                  hintText: "Enter your home address",
                  controller: addressController,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: "Next",
                  onPressed: () {
                    context.go(PaymentMethodPage.url);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

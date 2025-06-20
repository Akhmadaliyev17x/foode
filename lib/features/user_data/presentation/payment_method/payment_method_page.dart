import 'package:flutter/material.dart';
import 'package:foode/features/user_data/presentation/upload_photo/upload_photo.dart';
import 'package:foode/features/user_data/user_data.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodPage extends StatelessWidget {
  static const String url = "${FillBioPage.url}/payment-method";

  const PaymentMethodPage({super.key});

  static const List<String> _images = [
    "assets/images/png/paypal.png",
    "assets/images/png/visa.png",
    "assets/images/png/payoneer.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "Payment Method", hasBottom: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PaymentMethodSelector(imagePaths: _images),
              PrimaryButton(
                text: "Next",
                onPressed: () {
                  context.go(UploadPhotoPage.url);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

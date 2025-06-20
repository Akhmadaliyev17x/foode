import 'package:flutter/material.dart';
import 'package:foode/features/home/presentation/home_page/home_page.dart';
import 'package:foode/features/user_data/user_data.dart';
import 'package:go_router/go_router.dart';

class CongratsPage extends StatefulWidget {
  static const url = "${SetLocationPage.url}/congrats";
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => CongratsPageState();
}

class CongratsPageState extends State<CongratsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SplashWrapper(
            beginOffset: const Offset(0, 0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/images/png/splash_back.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SplashWrapper(
            onEnd: () {
              context.go(HomePage.url);
            },
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: AppIcons.congrats,
            ),
          ),
        ],
      ),
    );
  }
}

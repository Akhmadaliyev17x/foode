import 'package:flutter/material.dart';
import 'package:foode/core/constans/app_icons.dart';
import 'package:go_router/go_router.dart';

import '../../comonents/faded_wrapper.dart';
import '../get_started_page/get_started_page.dart';

class SplashPage extends StatefulWidget {
  static const url = "/";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashWrapper(
        onEnd: () {
          context.go(GetStartedPage.url);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/images/png/splash_back.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: AppIcons.splashIcon,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foode/core/components/custom_bottom_nav_bar.dart';
import 'package:foode/features/chat/presentation/chat_page.dart';
import 'package:foode/features/home/presentation/home_page/home_page.dart';
import 'package:foode/features/order/presentation/order_page.dart';
import 'package:foode/features/profile/presentation/profile_page.dart';
import 'package:go_router/go_router.dart';

import '../../core/constans/app_colors.dart';

class MainPage extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const MainPage({super.key, required this.child, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              "assets/images/png/splash_back.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Colors.white30,
                  AppColors.white,
                ],
              ),
            ),
          ),
          child,
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onChanged: (i) {
          if (i != currentIndex) {
            switch (i) {
              case 0:
                context.go(HomePage.url);
                break;
              case 1:
                context.go(OrderPage.url);
                break;
              case 2:
                context.go(ContactsPage.url);
                break;
              case 3:
                context.go(ProfilePage.url);
                break;
              default:
            }
          }
        },
      ),
    );
  }
}

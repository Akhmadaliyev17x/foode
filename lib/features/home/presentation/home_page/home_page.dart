import 'package:flutter/material.dart';
import 'package:foode/domain/data.dart';
import 'package:foode/features/home/home.dart';
import 'package:foode/features/home/presentation/notification/notification_page.dart';
import 'package:foode/features/home/presentation/restaurants/all_restaurants_page.dart';
import 'package:go_router/go_router.dart';

import '../manus/all_menus_page.dart';

class HomePage extends StatefulWidget {
  static const String url = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leadingWidth: 70,
        leading:
            Padding(padding: const EdgeInsets.all(14), child: AppIcons.logo),
        title: const Text(
          "Hello, Daniel!",
          style: AppTextStyles.appBar,
        ),
        actions: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.black8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              context.go(NotificationPage.url);
            },
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: AppColors.pink,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SearchAndFilter(),
            ),
            CarouselWidget(images: MockData.images, onTap: (index) {}),
            HeaderTexts(
              text: "Popular Restaurant",
              buttonText: "See all",
              onPressed: () {
                context.go(
                  AllRestaurantsPage.url,
                );
              },
            ),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: MockData.restaurants.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var resto = MockData.restaurants[index];
                  return RestaurantWidgetcard(resto: resto);
                },
              ),
            ),
            HeaderTexts(
              text: "Popular Menu",
              buttonText: "See all",
              onPressed: () {
                context.go(
                  AllMenusPage.url,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: MockData.menus.length,
                itemBuilder: (context, index) {
                  var menu = MockData.menus[index];
                  return FoodItemCard(
                    menu: menu,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

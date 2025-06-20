import 'package:flutter/material.dart';
import 'package:foode/core/components/custom_appbar.dart';
import 'package:foode/domain/data.dart';
import 'package:foode/features/home/home.dart';
import 'package:foode/features/home/presentation/home_page/home_page.dart';

class AllRestaurantsPage extends StatelessWidget {
  static const String url = "${HomePage.url}/restaurants";

  const AllRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context: context, title: "Popular restaurants"),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchAndFilter(),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: MockData.restaurants.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 10),
                  itemBuilder: (context, index) {
                    var resto = MockData.restaurants[index];
                    return RestaurantWidgetcard(resto: resto);
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

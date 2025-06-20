import 'package:flutter/material.dart';
import 'package:foode/core/components/custom_appbar.dart';
import 'package:foode/features/home/home.dart';
import 'package:foode/features/home/presentation/home_page/home_page.dart';

import '../../../../domain/data.dart';

class AllMenusPage extends StatelessWidget {
  static const String url = "${HomePage.url}/menus";

  const AllMenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context: context, title: "Popular menus"),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchAndFilter(),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: MockData.menus.length,
                  itemBuilder: (context, index) {
                    var menu = MockData.menus[index];
                    return FoodItemCard(
                      menu: menu,
                    );
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

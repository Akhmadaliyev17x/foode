import 'package:flutter/material.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/domain/data.dart';
import 'package:foode/features/profile/components/favorite_food_component.dart';

import '../components/voucher_component.dart';

class ProfilePage extends StatelessWidget {
  static const String url = "/profile";

  const ProfilePage({
    super.key,
  });

  static final user = MockData.users.first;
  static final favoriteItems = MockData.menus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // User Image - Upper Half
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Image.network(
              user.imgUrl,
              fit: BoxFit.cover,
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag handle
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      // User Info
                      const Chip(
                        label: Text("Member Gold"),
                        backgroundColor: AppColors.white,
                        labelStyle: TextStyle(color: AppColors.yellow),
                        shape: StadiumBorder(
                            side: BorderSide(color: AppColors.yellow)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.pink28,
                              shape: const StadiumBorder(),
                            ),
                            icon: const Icon(Icons.edit, color: Colors.pink),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      VoucherComponent(
                        title: "You have 4 vouchers",
                        svgIcon: AppIcons.balance,
                      ),
                      const SizedBox(height: 24),

                      // Favorite Title
                      const HeaderTexts(
                          text: "Favorite", buttonText: "See all"),
                      const SizedBox(height: 12),
                      ...favoriteItems.map((item) => FavoriteFoodComponent(
                            item: item,
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

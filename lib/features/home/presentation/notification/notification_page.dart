import 'package:flutter/material.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/core/components/custom_search_bar.dart';
import 'package:foode/features/home/components/notification_tile.dart';
import 'package:foode/features/home/models/notification_model.dart';
import 'package:foode/features/user_data/user_data.dart';

class NotificationPage extends StatefulWidget {
  static const String url = "${HomePage.url}/notifications";

  const NotificationPage({super.key});

  static final _notifications = [
    NotificationModel(
      svgIcon: AppIcons.congrats,
      title: "Your order is completed!",
      time: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
    ),
    NotificationModel(
      svgIcon: AppIcons.congrats,
      title: "Your order is completed!",
      time: DateTime.now().subtract(
        const Duration(minutes: 25),
      ),
    ),
    NotificationModel(
      svgIcon: AppIcons.balance,
      title: "You received 200 points",
      time: DateTime.now().subtract(
        const Duration(minutes: 39),
      ),
    ),
  ];

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> _list = NotificationPage._notifications;

  void search(String input) {
    if (input.trim().isEmpty) {
      _list = NotificationPage._notifications;
    } else {
      final query = input.toLowerCase();
      _list = NotificationPage._notifications
          .where((e) => e.title.toLowerCase().startsWith(query))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: customAppBar(context: context, title: "Notification"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomSearchBar(
              onChanged: search,
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < _list.length; i++)
              NotificationTile(notification: NotificationPage._notifications[i])
          ],
        ),
      ),
    );
  }
}

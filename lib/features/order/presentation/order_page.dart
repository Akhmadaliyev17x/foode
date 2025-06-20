import 'package:flutter/material.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/core/components/custom_appbar.dart';
import 'package:foode/domain/data.dart';

import '../../../core/components/order_tile.dart';

class OrderPage extends StatefulWidget {
  static const String url = "/order";

  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  static List<MenuModel> _list = MockData.menus;

  void search(String input) {
    if (input.trim().isEmpty) {
      _list = MockData.menus;
    } else {
      final query = input.toLowerCase();
      _list = MockData.menus
          .where((e) =>
              e.title.toLowerCase().startsWith(query) ||
              e.subtitle.toLowerCase().startsWith(query))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Order History"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SearchAndFilter(
            onChanged: (input) {
              search(input);
            },
          ),
          if (_list.isNotEmpty)
            for (int i = 0; i < _list.length; i++)
              OrderTile(menu: MockData.menus[i]),
          if (_list.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  "No contact yet",
                  style: AppTextStyles.h5(color: Colors.black),
                ),
              ),
            )
        ],
      ),
    );
  }
}

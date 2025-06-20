import 'package:flutter/material.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/core/components/contact_tile.dart';
import 'package:foode/core/components/custom_appbar.dart';
import 'package:foode/core/components/custom_search_bar.dart';
import 'package:foode/domain/data.dart';
import 'package:foode/domain/models/user_model.dart';

class ContactsPage extends StatefulWidget {
  static const String url = "/contacts";

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<UserModel> _contacts = MockData.users;

  void search(String input) {
    if (input.trim().isEmpty) {
      _contacts = MockData.users;
    } else {
      final query = input.toLowerCase();
      _contacts = MockData.users
          .where((e) => e.name.toLowerCase().startsWith(query))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: customAppBar(context: context, title: "Chat"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomSearchBar(
                  onChanged: search,
                ),
                if (_contacts.isNotEmpty)
                  for (int index = 0; index < _contacts.length; index++)
                    ContactTile(
                        user: _contacts[index],
                        lastMessage: _contacts[index].messages.last),
                if (_contacts.isEmpty)
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
          ),
        ),
      ),
    );
  }
}

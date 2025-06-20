import 'package:flutter/material.dart';
import 'package:foode/config/router/router_libs.dart';
import 'package:foode/core/components/contact_tile.dart';
import 'package:foode/core/components/custom_appbar.dart';
import 'package:foode/core/components/custom_search_bar.dart';
import 'package:foode/domain/models/user_model.dart';

class ContactsPage extends StatefulWidget {
  static const String url = "/contacts";

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  static final List<UserModel> fakeUsers = [
    UserModel(
      userId: 'user_001',
      fullName: 'John Doe',
      nickName: 'johnd',
      email: 'john.doe@example.com',
      password: 'password123',
      phoneNumber: '+1234567890',
      dateOfBirth: DateTime(1995, 5, 20),
      address: '123 Main Street, New York, USA',
      profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      location: 'New York',
      isVerified: true,
      isOnline: true,
      messages: [],
      createdAt: DateTime.now().subtract(const Duration(days: 300)),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      userId: 'user_002',
      fullName: 'Jane Smith',
      nickName: 'jsmith',
      email: 'jane.smith@example.com',
      password: 'password456',
      phoneNumber: '+9876543210',
      dateOfBirth: DateTime(1998, 11, 12),
      address: '456 Park Ave, Los Angeles, USA',
      profileImageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      location: 'Los Angeles',
      isVerified: true,
      isOnline: false,
      messages: [],
      createdAt: DateTime.now().subtract(Duration(days: 500)),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      userId: 'user_003',
      fullName: 'Ahmad Rahmonov',
      nickName: 'ahmad_r',
      email: 'ahmad.rahmonov@mail.com',
      password: 'qwerty123',
      phoneNumber: '+998901234567',
      dateOfBirth: DateTime(2002, 3, 15),
      address: 'Yunusobod 5, Toshkent, O‘zbekiston',
      profileImageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      location: 'Toshkent',
      isVerified: false,
      isOnline: true,
      messages: [],
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      userId: 'user_004',
      fullName: 'Laylo Karimova',
      nickName: 'layloo',
      email: 'laylo.karimova@gmail.com',
      password: 'securepass',
      phoneNumber: '+998911112233',
      dateOfBirth: DateTime(2000, 7, 1),
      address: 'Chilonzor 10, Toshkent, O‘zbekiston',
      profileImageUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      location: 'Toshkent',
      isVerified: true,
      isOnline: false,
      messages: [],
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now(),
    ),
  ];
  List<UserModel> _contacts = fakeUsers;

  void search(String input) {
    if (input.trim().isEmpty) {
      _contacts = fakeUsers;
    } else {
      final query = input.toLowerCase();
      _contacts = fakeUsers
          .where((e) => e.fullName.toLowerCase().startsWith(query))
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
                      lastMessage: _contacts[index].messages.isNotEmpty
                          ? _contacts[index].messages.last
                          : "Hello world",
                    ),
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

import 'package:flutter/material.dart';

import '../../features/home/home.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        onChanged: onChanged,
        hintStyle:
            const WidgetStatePropertyAll(TextStyle(color: AppColors.black12)),
        trailing: const [
          Icon(
            CupertinoIcons.search,
            color: AppColors.black12,
          ),
          SizedBox(width: 10)
        ],
        hintText: "Search",
        leading: const SizedBox(width: 10),
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: const WidgetStatePropertyAll(AppColors.black8),
      ),
    );
  }
}

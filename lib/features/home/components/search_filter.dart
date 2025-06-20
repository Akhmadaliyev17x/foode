import 'package:flutter/material.dart';
import 'package:foode/core/components/custom_search_bar.dart';
import 'package:foode/features/home/home.dart';

class SearchAndFilter extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchAndFilter({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CustomSearchBar(
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        const Card(
          elevation: 0,
          color: AppColors.pink28,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/png/filter.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

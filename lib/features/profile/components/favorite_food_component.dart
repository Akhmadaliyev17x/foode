import 'package:flutter/material.dart';
import 'package:foode/features/home/models/menu_model.dart';

import '../../../core/constans/app_colors.dart';

class FavoriteFoodComponent extends StatelessWidget {
  final MenuModel item;
  const FavoriteFoodComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: AppColors.black34, blurRadius: 50)],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imgUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(item.subtitle, style: const TextStyle(color: Colors.grey)),
                Text(item.price.toStringAsFixed(0),
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(Icons.favorite, color: Colors.pink),
        ],
      ),
    );
  }
}

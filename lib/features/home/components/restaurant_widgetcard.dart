import 'package:flutter/material.dart';
import 'package:foode/features/home/home.dart';

class RestaurantWidgetcard extends StatelessWidget {
  final RestaurantCardModel resto;
  const RestaurantWidgetcard({super.key, required this.resto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.white,
      child: SizedBox(
        height: 140,
        width: 150,
        child: Center(
          child: Column(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: SvgPicture.asset(resto.icon),
              ),
              const SizedBox(height: 5),
              Text(
                resto.title,
                style: AppTextStyles.h5(color: Colors.black),
              ),
              Text(
                "${resto.minutes} mins",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

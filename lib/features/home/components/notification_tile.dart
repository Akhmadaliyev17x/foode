import 'package:flutter/material.dart';
import 'package:foode/features/home/models/notification_model.dart';

import '../../user_data/user_data.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(height: 60, width: 60, child: notification.svgIcon),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: AppTextStyles.h5(color: AppColors.black),
              ),
              Text(
                DateFormat(DateFormat.HOUR_MINUTE).format(notification.time),
                style: AppTextStyles.h6(color: AppColors.black54),
              )
            ],
          ),
        ],
      ),
    );
  }
}

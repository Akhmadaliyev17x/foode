import 'package:flutter_svg/flutter_svg.dart';

class NotificationModel {
  final SvgPicture svgIcon;
  final String title;
  final DateTime time;

  const NotificationModel({
    required this.svgIcon,
    required this.title,
    required this.time,
  });
}

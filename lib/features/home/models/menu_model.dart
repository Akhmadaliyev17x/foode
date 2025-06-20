import '../../../core/components/order_tile.dart';

class MenuModel {
  final String title;
  final String subtitle;
  final String imgUrl;
  final double price;
  final OrderStatus status;

  const MenuModel({
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    required this.price,
    required this.status,
  });
}

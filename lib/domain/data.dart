import 'package:foode/config/router/router_libs.dart';

import '../core/components/order_tile.dart';
import 'models/user_model.dart';

sealed class MockData {
  static const images = [
    "assets/images/carousel/burger.png",
    "assets/images/carousel/cheeseburger.jpg",
    "assets/images/carousel/macdonalds_burger.png"
  ];
  static const restaurants = <RestaurantCardModel>[
    RestaurantCardModel(
        icon: "assets/images/svg/lovy.svg", title: "Lovy Food", minutes: 10),
    RestaurantCardModel(
        icon: "assets/images/svg/cloud.svg",
        title: "Cloudy Resto",
        minutes: 28),
    RestaurantCardModel(
        icon: "assets/images/svg/circlo.svg",
        title: "Circlo Resto",
        minutes: 30),
    RestaurantCardModel(
        icon: "assets/images/svg/haty.svg", title: "Haty Food", minutes: 30),
    RestaurantCardModel(
        icon: "assets/images/svg/hearthy.svg",
        title: "Hearthy Resto",
        minutes: 30),
    RestaurantCardModel(
        icon: "assets/images/svg/recto.svg",
        title: "Hearthy Food",
        minutes: 30),
  ];
  static const menus = <MenuModel>[
    MenuModel(
      title: "Original Salad",
      subtitle: "Lovy Food",
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvlw1d20ga9hQJoJJHjhwMtivPPFY3gqM-TptGQC6k2z26hVJEsYgX4p4lOghP0tb1HCk&usqp=CAU",
      price: 8,
      status: OrderStatus.process,
    ),
    MenuModel(
      title: "Fresh Salad",
      subtitle: "Cloudy Resto",
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOSeJEPO-d-mbmItCKhgGs8pXwHV2r7_A8fJSD5kG-ijlfyQkmqY3g_TGY5lLRhR21qdw&usqp=CAU",
      price: 10,
      status: OrderStatus.process,
    ),
    MenuModel(
      title: "Yummy Ice Cream",
      subtitle: "Circlo Resto",
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ59CXOyMsclLprI54b8fBTfgafPB4p4xxF4A&s",
      price: 6,
      status: OrderStatus.completed,
    ),
    MenuModel(
      title: "Vegan Special",
      subtitle: "Haty food",
      imgUrl:
          "https://www.press-citizen.com/gcdn/authoring/authoring-images/2025/04/07/NATR/82982783007-vegan-column-pic.jpg?width=660&height=698&fit=crop&format=pjpg&auto=webp",
      price: 11,
      status: OrderStatus.canceled,
    ),
  ];
  static final List<UserModel> users = [
    UserModel(
        userId: "userId",
        fullName: "Muhammad Ali",
        nickName: "akhmadaliyev",
        email: "akhmadaliyev17x@gmail.com",
        password: "12345678",
        phoneNumber: "+998770147678",
        dateOfBirth: DateTime(2005, 09, 18),
        address: "Tashkent",
        isVerified: true,
        isOnline: true,
        messages: ["Hello"],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];
}

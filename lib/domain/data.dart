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
  static final List<UserModel> users = <UserModel>[
    UserModel(
      email: "example@gmail.com",
      userId: 1,
      name: 'John Smith',
      imgUrl: 'https://picsum.photos/id/1011/200/200',
      isOnline: true,
      lastOnline: DateTime.now(),
      messages: ['Hey!', 'How are you?', 'Let’s catch up later.'],
    ),
    UserModel(
      userId: 2,
      email: "example@gmail.com",
      name: 'Emily Johnson',
      imgUrl: 'https://picsum.photos/id/1012/200/200',
      isOnline: false,
      lastOnline: DateTime.now().subtract(const Duration(minutes: 12)),
      messages: ['Good morning!', 'Did you see the news today?'],
    ),
    UserModel(
      userId: 3,
      email: "example@gmail.com",
      name: 'Michael Brown',
      imgUrl: 'https://picsum.photos/id/1013/200/200',
      isOnline: false,
      lastOnline:
          DateTime.now().subtract(const Duration(hours: 1, minutes: 25)),
      messages: ['I’m on my way.', 'Be there in 10 mins.'],
    ),
    UserModel(
      userId: 4,
      email: "example@gmail.com",
      name: 'Sophia Davis',
      imgUrl: 'https://picsum.photos/id/1014/200/200',
      isOnline: true,
      lastOnline: DateTime.now(),
      messages: ['Hello!', 'Are we still meeting today?'],
    ),
    UserModel(
      userId: 5,
      email: "example@gmail.com",
      name: 'James Wilson',
      imgUrl: 'https://picsum.photos/id/1015/200/200',
      isOnline: false,
      lastOnline: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      messages: ['Meeting postponed.', 'Let’s reschedule.'],
    ),
    UserModel(
      userId: 6,
      email: "example@gmail.com",
      name: 'Olivia Martinez',
      imgUrl: 'https://picsum.photos/id/1016/200/200',
      isOnline: true,
      lastOnline: DateTime.now(),
      messages: ['Okay', 'Thanks!', 'See you soon.'],
    ),
    UserModel(
      userId: 7,
      email: "example@gmail.com",
      name: 'Daniel Anderson',
      imgUrl: 'https://picsum.photos/id/1018/200/200',
      isOnline: false,
      lastOnline: DateTime.now().subtract(const Duration(minutes: 40)),
      messages: ['Can you send me the file?', 'Thanks!'],
    ),
    UserModel(
      userId: 8,
      email: "example@gmail.com",
      name: 'Ava Thomas',
      imgUrl: 'https://picsum.photos/id/1020/200/200',
      isOnline: false,
      lastOnline:
          DateTime.now().subtract(const Duration(hours: 3, minutes: 10)),
      messages: ['Let’s talk tomorrow.', 'I’m tired today.'],
    ),
    UserModel(
      userId: 9,
      email: "example@gmail.com",
      name: 'William Taylor',
      imgUrl: 'https://picsum.photos/id/1021/200/200',
      isOnline: true,
      lastOnline: DateTime.now(),
      messages: ['Nice job!', 'You nailed it.'],
    ),
    UserModel(
      userId: 10,
      email: "example@gmail.com",
      name: 'Isabella Moore',
      imgUrl: 'https://picsum.photos/id/1022/200/200',
      isOnline: false,
      lastOnline: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
      messages: ['Happy Birthday!', 'Wish you all the best.'],
    ),
  ];
}

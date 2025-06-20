class UserModel {
  final int userId;
  final String name;
  final String email;
  final String imgUrl;
  final bool isOnline;
  final DateTime lastOnline;
  final List<String> messages;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.imgUrl,
    required this.isOnline,
    required this.lastOnline,
    required this.messages,
  });

  String get lastMessage => messages.isNotEmpty ? messages.last : '';
}

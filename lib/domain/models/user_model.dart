class UserModel {
  final String userId;
  final String fullName;
  final String nickName;
  final String email;
  final String password;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;
  final String? profileImageUrl;
  final String? location;
  final bool isVerified;
  final bool isOnline;
  final List<String> messages;
  final DateTime createdAt;
  final DateTime updatedAt;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.userId,
    required this.fullName,
    required this.nickName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    this.profileImageUrl,
    this.location,
    required this.isVerified,
    required this.isOnline,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          fullName == other.fullName &&
          nickName == other.nickName &&
          email == other.email &&
          password == other.password &&
          phoneNumber == other.phoneNumber &&
          dateOfBirth == other.dateOfBirth &&
          address == other.address &&
          profileImageUrl == other.profileImageUrl &&
          location == other.location &&
          isVerified == other.isVerified &&
          isOnline == other.isOnline &&
          messages == other.messages &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      userId.hashCode ^
      fullName.hashCode ^
      nickName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      dateOfBirth.hashCode ^
      address.hashCode ^
      profileImageUrl.hashCode ^
      location.hashCode ^
      isVerified.hashCode ^
      isOnline.hashCode ^
      messages.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' userId: $userId,' +
        ' fullName: $fullName,' +
        ' nickName: $nickName,' +
        ' email: $email,' +
        ' password: $password,' +
        ' phoneNumber: $phoneNumber,' +
        ' dateOfBirth: $dateOfBirth,' +
        ' address: $address,' +
        ' profileImageUrl: $profileImageUrl,' +
        ' location: $location,' +
        ' isVerified: $isVerified,' +
        ' isOnline: $isOnline,' +
        ' messages: $messages,' +
        ' createdAt: $createdAt,' +
        ' updatedAt: $updatedAt,' +
        '}';
  }

  UserModel copyWith({
    String? userId,
    String? fullName,
    String? nickName,
    String? email,
    String? password,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? profileImageUrl,
    String? location,
    bool? isVerified,
    bool? isOnline,
    List<String>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      location: location ?? this.location,
      isVerified: isVerified ?? this.isVerified,
      isOnline: isOnline ?? this.isOnline,
      messages: messages ?? this.messages,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'fullName': this.fullName,
      'nickName': this.nickName,
      'email': this.email,
      'password': this.password,
      'phoneNumber': this.phoneNumber,
      'dateOfBirth': this.dateOfBirth,
      'address': this.address,
      'profileImageUrl': this.profileImageUrl,
      'location': this.location,
      'isVerified': this.isVerified,
      'isOnline': this.isOnline,
      'messages': this.messages,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      fullName: map['fullName'] as String,
      nickName: map['nickName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      dateOfBirth: map['dateOfBirth'] as DateTime,
      address: map['address'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
      location: map['location'] as String,
      isVerified: map['isVerified'] as bool,
      isOnline: map['isOnline'] as bool,
      messages: map['messages'] as List<String>,
      createdAt: map['createdAt'] as DateTime,
      updatedAt: map['updatedAt'] as DateTime,
    );
  }
}

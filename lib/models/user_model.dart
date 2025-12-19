import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String userId;
  final String name;
  final String? email;
  final String? phone;
  final String? gender;
  final int? age;
  final List<String> interests;
  final List<String> languages;
  final double balance;
  final double totalBalance;
  final DateTime createdAt;
  final bool permission;
  final bool isOnline;
  final bool isVideo;
  final bool isVoice;
  final bool isAdmin;
  final bool isBanned;
  final bool isAvailable;
  final String? imagePath;
  final String? updatedProfile;
  final List<String> blockedUsers;

  UserModel({
    required this.uid,
    this.userId = "",
    required this.name,
    this.email,
    this.phone,
    this.gender,
    this.age,
    this.interests = const [],
    this.languages = const [],
    this.balance = 100.0,
    this.totalBalance = 100.0,
    DateTime? createdAt,
    this.permission = false,
    this.isOnline = false,
    this.isVideo = false,
    this.isVoice = false,
    this.isAdmin = false,
    this.isBanned = false,
    this.isAvailable = false,
    this.imagePath,
    this.updatedProfile,
    this.blockedUsers = const [],
  }) : createdAt = createdAt ?? DateTime.now();

  /// 🔹 Convert Firestore map → UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      uid: id,
      userId: map['UserId'] ?? "",
      name: map['name'] ?? '',
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      age: map['age'] is int ? map['age'] : null,
      interests: map['interests'] != null
          ? List<String>.from(map['interests'])
          : [],
      languages: map['languages'] != null
          ? List<String>.from(map['languages'])
          : [],
      blockedUsers: map['blockedUsers'] != null
          ? List<String>.from(map['blockedUsers'])
          : [],
      balance: map['balance'] != null
          ? (map['balance'] is int
                ? (map['balance'] as int).toDouble()
                : map['balance'])
          : 100.0,
      totalBalance: map['totalBalance'] != null
          ? (map['totalBalance'] is int
                ? (map['totalBalance'] as int).toDouble()
                : map['totalBalance'])
          : 100.0,
      createdAt: map['createdAt'] is Timestamp
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      permission: map['permission'] ?? false,
      isOnline: map['isOnline'] ?? false,
      isVideo: map['isVideo'] ?? false,
      isVoice: map['isVoice'] ?? false,
      isAvailable: map['isAvailable'] ?? false,
      isAdmin: map['isAdmin'] ?? false,
      isBanned: map['isBanned'] ?? false,
      imagePath: map['imagePath'],
      updatedProfile: map['updatedProfile'],
    );
  }

  /// 🔹 Convert UserModel → Firestore map
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "UserId": userId,
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "age": age,
      "interests": interests,
      "languages": languages,
      "blockedUsers": blockedUsers,
      "balance": balance,
      "totalBalance": totalBalance,
      "createdAt": createdAt,
      "permission": permission,
      "isOnline": isOnline,
      "isAdmin": isAdmin,
      "isBanned": isBanned,
      "isVideo": isVideo,
      "isVoice": isVoice,
      "isAvailable": isAvailable,
      "imagePath": imagePath,
      "updatedProfile": updatedProfile,
    };
  }

  /// 🔹 CopyWith method for updates
  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    int? age,
    List<String>? interests,
    List<String>? languages,
    List<String>? blockedUsers,
    double? balance,
    double? totalBalance,
    bool? permission,
    bool? isOnline,
    bool? isVideo,
    bool? isVoice,
    bool? isAdmin,
    bool? isBanned,
    bool? isAvailable,
    String? imagePath,
    String? updatedProfile,
  }) {
    return UserModel(
      uid: uid,
      userId: userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      blockedUsers: blockedUsers ?? this.blockedUsers,
      balance: balance ?? this.balance,
      totalBalance: totalBalance ?? this.totalBalance,
      createdAt: createdAt,
      permission: permission ?? this.permission,
      isOnline: isOnline ?? this.isOnline,
      isVideo: isVideo ?? this.isVideo,
      isVoice: isVoice ?? this.isVoice,
      isAdmin: isAdmin ?? this.isAdmin,
      isBanned: isBanned ?? this.isBanned,
      isAvailable: isAvailable ?? this.isAvailable,
      imagePath: imagePath ?? this.imagePath,
      updatedProfile: updatedProfile ?? this.updatedProfile,
    );
  }
}

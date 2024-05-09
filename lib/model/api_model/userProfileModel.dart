// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  bool status;
  String message;
  List<Datum> data;

  UserProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String email;
  String phone;
  String profile;
  dynamic intrestId;
  String status;
  dynamic countryCode;
  int loginType;
  int pushNotification;
  int isActive;
  int mobVerify;
  String fcmToken;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
    required this.intrestId,
    required this.status,
    required this.countryCode,
    required this.loginType,
    required this.pushNotification,
    required this.isActive,
    required this.mobVerify,
    required this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profile: json["profile"],
        intrestId: json["intrest_id"],
        status: json["status"],
        countryCode: json["country_code"],
        loginType: json["login_type"],
        pushNotification: json["push_notification"],
        isActive: json["is_active"],
        mobVerify: json["mob_verify"],
        fcmToken: json["fcm_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile": profile,
        "intrest_id": intrestId,
        "status": status,
        "country_code": countryCode,
        "login_type": loginType,
        "push_notification": pushNotification,
        "is_active": isActive,
        "mob_verify": mobVerify,
        "fcm_token": fcmToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

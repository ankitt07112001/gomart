// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool status;
  String message;
  List<Datum> data;

  Welcome({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
  int bannerId;
  String bannerImage;
  String bannerTitle;
  String bannerPublish;
  String setOrder;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.bannerId,
    required this.bannerImage,
    required this.bannerTitle,
    required this.bannerPublish,
    required this.setOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bannerId: json["banner_id"],
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
        bannerPublish: json["banner_publish"],
        setOrder: json["set_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_image": bannerImage,
        "banner_title": bannerTitle,
        "banner_publish": bannerPublish,
        "set_order": setOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

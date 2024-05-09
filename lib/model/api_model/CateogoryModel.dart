// To parse this JSON data, do
//
//     final cateogoryModel = cateogoryModelFromJson(jsonString);

import 'dart:convert';

CateogoryModel cateogoryModelFromJson(String str) =>
    CateogoryModel.fromJson(json.decode(str));

String cateogoryModelToJson(CateogoryModel data) => json.encode(data.toJson());

class CateogoryModel {
  bool status;
  String message;
  List<Datum> data;

  CateogoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CateogoryModel.fromJson(Map<String, dynamic> json) => CateogoryModel(
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
  int catId;
  String categoryName;
  String categoryImage;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.catId,
    required this.categoryName,
    required this.categoryImage,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        catId: json["cat_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

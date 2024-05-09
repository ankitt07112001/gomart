// To parse this JSON data, do
//
//     final getFavouriteModel = getFavouriteModelFromJson(jsonString);

import 'dart:convert';

GetFavouriteModel getFavouriteModelFromJson(String str) =>
    GetFavouriteModel.fromJson(json.decode(str));

String getFavouriteModelToJson(GetFavouriteModel data) =>
    json.encode(data.toJson());

class GetFavouriteModel {
  bool status;
  String message;
  List<Datum> data;

  GetFavouriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) =>
      GetFavouriteModel(
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
  String itemId;
  String categoryId;
  String storeId;
  String itemName;
  String itemPrice;
  String itemPublish;
  String organicImage;
  int quantity;
  String disItemPrice;
  String itemImage;
  String itemWeight;
  DateTime itemExpiryDate;
  String itemDescription;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int id;
  String userId;
  String likeStatus;

  Datum({
    required this.itemId,
    required this.categoryId,
    required this.storeId,
    required this.itemName,
    required this.itemPrice,
    required this.itemPublish,
    required this.organicImage,
    required this.quantity,
    required this.disItemPrice,
    required this.itemImage,
    required this.itemWeight,
    required this.itemExpiryDate,
    required this.itemDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.id,
    required this.userId,
    required this.likeStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        itemId: json["item_id"],
        categoryId: json["category_id"],
        storeId: json["store_id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        itemPublish: json["item_publish"],
        organicImage: json["organic_image"],
        quantity: json["quantity"],
        disItemPrice: json["dis_item_price"],
        itemImage: json["item_image"],
        itemWeight: json["item_weight"],
        itemExpiryDate: DateTime.parse(json["item_expiry_date"]),
        itemDescription: json["item_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        id: json["id"],
        userId: json["user_id"],
        likeStatus: json["like_status"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "category_id": categoryId,
        "store_id": storeId,
        "item_name": itemName,
        "item_price": itemPrice,
        "item_publish": itemPublish,
        "organic_image": organicImage,
        "quantity": quantity,
        "dis_item_price": disItemPrice,
        "item_image": itemImage,
        "item_weight": itemWeight,
        "item_expiry_date":
            "${itemExpiryDate.year.toString().padLeft(4, '0')}-${itemExpiryDate.month.toString().padLeft(2, '0')}-${itemExpiryDate.day.toString().padLeft(2, '0')}",
        "item_description": itemDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "id": id,
        "user_id": userId,
        "like_status": likeStatus,
      };
}

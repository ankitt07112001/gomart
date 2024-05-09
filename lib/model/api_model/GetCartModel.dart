// To parse this JSON data, do
//
//     final getCartMOdel = getCartMOdelFromJson(jsonString);

import 'dart:convert';

GetCartMOdel getCartMOdelFromJson(String str) =>
    GetCartMOdel.fromJson(json.decode(str));

String getCartMOdelToJson(GetCartMOdel data) => json.encode(data.toJson());

class GetCartMOdel {
  bool status;
  String message;
  List<Datum> data;

  GetCartMOdel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCartMOdel.fromJson(Map<String, dynamic> json) => GetCartMOdel(
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
  String itemImage;
  String itemId;
  String itemName;
  int id;
  String itemWeight;
  String itemQuantity;
  String itemPrice;
  String disItemPrice;
  String itemDescription;
  String itemExpiryDate;

  Datum({
    required this.itemImage,
    required this.itemId,
    required this.itemName,
    required this.id,
    required this.itemWeight,
    required this.itemQuantity,
    required this.itemPrice,
    required this.disItemPrice,
    required this.itemDescription,
    required this.itemExpiryDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        itemImage: json["item_image"],
        itemId: json["item_id"],
        itemName: json["item_name"],
        id: json["id"],
        itemWeight: json["item_weight"],
        itemQuantity: json["item_quantity"],
        itemPrice: json["item_price"],
        disItemPrice: json["dis_item_price"],
        itemDescription: json["item_description"],
        itemExpiryDate: json["item_expiry_date"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "item_image": itemImage,
        "item_id": itemId,
        "item_name": itemName,
        "id": id,
        "item_weight": itemWeight,
        "item_quantity": itemQuantity,
        "item_price": itemPrice,
        "dis_item_price": disItemPrice,
        "item_description": itemDescription,
        "item_expiry_date": "${itemExpiryDate}",
      };
}

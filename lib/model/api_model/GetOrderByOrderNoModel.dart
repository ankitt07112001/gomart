// To parse this JSON data, do
//
//     final getOrderByorderNoModel = getOrderByorderNoModelFromJson(jsonString);

import 'dart:convert';

GetOrderByorderNoModel getOrderByorderNoModelFromJson(String str) =>
    GetOrderByorderNoModel.fromJson(json.decode(str));

String getOrderByorderNoModelToJson(GetOrderByorderNoModel data) =>
    json.encode(data.toJson());

class GetOrderByorderNoModel {
  bool status;
  String message;
  List<Datum> data;

  GetOrderByorderNoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetOrderByorderNoModel.fromJson(Map<String, dynamic> json) =>
      GetOrderByorderNoModel(
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
  String orderNo;
  String userId;
  dynamic driverId;
  dynamic storeId;
  String orderDate;
  String orderTime;
  String address;
  String orderAmount;
  String paymentMethod;
  dynamic couponId;
  String orderType;
  String orderStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String userName;
  String itemId;
  String itemName;
  String itemWeight;
  String itemQuantity;
  String itemPrice;
  String itemImage;
  dynamic couponDiscount;

  Datum({
    required this.id,
    required this.orderNo,
    required this.userId,
    required this.driverId,
    required this.storeId,
    required this.orderDate,
    required this.orderTime,
    required this.address,
    required this.orderAmount,
    required this.paymentMethod,
    required this.couponId,
    required this.orderType,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userName,
    required this.itemId,
    required this.itemName,
    required this.itemWeight,
    required this.itemQuantity,
    required this.itemPrice,
    required this.itemImage,
    required this.couponDiscount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderNo: json["order_no"],
        userId: json["user_id"],
        driverId: json["driver_id"],
        storeId: json["store_id"],
        orderDate: json["order_date"],
        orderTime: json["order_time"],
        address: json["address"],
        orderAmount: json["order_amount"],
        paymentMethod: json["payment_method"],
        couponId: json["coupon_id"],
        orderType: json["order_type"],
        orderStatus: json["order_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userName: json["user_name"],
        itemId: json["item_id"],
        itemName: json["item_name"],
        itemWeight: json["item_weight"].toString(),
        itemQuantity: json["quantity"].toString(),
        itemPrice: json["item_price"],
        itemImage: json["item_image"],
        couponDiscount: json["coupon_discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "user_id": userId,
        "driver_id": driverId,
        "store_id": storeId,
        "order_date": orderDate,
        "order_time": orderTime,
        "address": address,
        "order_amount": orderAmount,
        "payment_method": paymentMethod,
        "coupon_id": couponId,
        "order_type": orderType,
        "order_status": orderStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "user_name": userName,
        "item_id": itemId,
        "item_name": itemName,
        "item_weight": itemWeight,
        "quantity": itemQuantity,
        "item_price": itemPrice,
        "item_image": itemImage,
        "coupon_discount": couponDiscount,
      };
}

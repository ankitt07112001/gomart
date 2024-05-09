// To parse this JSON data, do
//
//     final getOrderDetailModel = getOrderDetailModelFromJson(jsonString);

import 'dart:convert';

GetOrderDetailModel getOrderDetailModelFromJson(String str) =>
    GetOrderDetailModel.fromJson(json.decode(str));

String getOrderDetailModelToJson(GetOrderDetailModel data) =>
    json.encode(data.toJson());

class GetOrderDetailModel {
  bool status;
  String message;
  List<Datum> data;

  GetOrderDetailModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDetailModel(
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
  String couponId;
  String orderType;
  String orderStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String name;

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
    required this.name,
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
        couponId: json["coupon_id"].toString(),
        orderType: json["order_type"],
        orderStatus: json["order_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        name: json["name"],
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
        "name": name,
      };
}

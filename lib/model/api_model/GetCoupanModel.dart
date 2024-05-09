// To parse this JSON data, do
//
//     final getCoupanModel = getCoupanModelFromJson(jsonString);

import 'dart:convert';

GetCoupanModel getCoupanModelFromJson(String str) =>
    GetCoupanModel.fromJson(json.decode(str));

String getCoupanModelToJson(GetCoupanModel data) => json.encode(data.toJson());

class GetCoupanModel {
  bool status;
  String message;
  List<CouponDatum> data;

  GetCoupanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCoupanModel.fromJson(Map<String, dynamic> json) => GetCoupanModel(
        status: json["status"],
        message: json["message"],
        data: List<CouponDatum>.from(
            json["data"].map((x) => CouponDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CouponDatum {
  int coupanId;
  String coupanTitle;
  String discount;
  String coupanCode;
  String couponImage;
  String storeId;
  String couponDesc;
  DateTime expiryDate;
  String coupanStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  CouponDatum({
    required this.coupanId,
    required this.coupanTitle,
    required this.discount,
    required this.coupanCode,
    required this.couponImage,
    required this.storeId,
    required this.couponDesc,
    required this.expiryDate,
    required this.coupanStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory CouponDatum.fromJson(Map<String, dynamic> json) => CouponDatum(
        coupanId: json["coupan_id"],
        coupanTitle: json["coupan_title"],
        discount: json["discount"],
        coupanCode: json["coupan_code"],
        couponImage: json["coupon_image"],
        storeId: json["store_id"],
        couponDesc: json["coupon_desc"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        coupanStatus: json["coupan_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "coupan_id": coupanId,
        "coupan_title": coupanTitle,
        "discount": discount,
        "coupan_code": coupanCode,
        "coupon_image": couponImage,
        "store_id": storeId,
        "coupon_desc": couponDesc,
        "expiry_date":
            "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "coupan_status": coupanStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

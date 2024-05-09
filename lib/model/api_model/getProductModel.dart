// // To parse this JSON data, do
// //
// //     final getProductModel = getProductModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetProductModel getProductModelFromJson(String str) =>
//     GetProductModel.fromJson(json.decode(str));
//
// String getProductModelToJson(GetProductModel data) =>
//     json.encode(data.toJson());
//
// class GetProductModel {
//   bool status;
//   String message;
//   Data data;
//
//   GetProductModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory GetProductModel.fromJson(Map<String, dynamic> json) =>
//       GetProductModel(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class Data {
//   List<Product> product;
//
//   Data({
//     required this.product,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         product:
//             List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "product": List<dynamic>.from(product.map((x) => x.toJson())),
//       };
// }
//
// class Product {
//   int itemId;
//   String categoryId;
//   String storeId;
//   String itemName;
//   String itemPrice;
//   String itemPublish;
//   String organicImage;
//   int quantity;
//   String disItemPrice;
//   String itemImage;
//   String itemWeight;
//   DateTime itemExpiryDate;
//   String itemDescription;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//   dynamic rating;
//
//   Product({
//     required this.itemId,
//     required this.categoryId,
//     required this.storeId,
//     required this.itemName,
//     required this.itemPrice,
//     required this.itemPublish,
//     required this.organicImage,
//     required this.quantity,
//     required this.disItemPrice,
//     required this.itemImage,
//     required this.itemWeight,
//     required this.itemExpiryDate,
//     required this.itemDescription,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.deletedAt,
//     required this.rating,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         itemId: json["item_id"],
//         categoryId: json["category_id"],
//         storeId: json["store_id"],
//         itemName: json["item_name"],
//         itemPrice: json["item_price"],
//         itemPublish: json["item_publish"],
//         organicImage: json["organic_image"],
//         quantity: json["quantity"],
//         disItemPrice: json["dis_item_price"],
//         itemImage: json["item_image"],
//         itemWeight: json["item_weight"],
//         itemExpiryDate: DateTime.parse(json["item_expiry_date"]),
//         itemDescription: json["item_description"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         rating: json["rating"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "item_id": itemId,
//         "category_id": categoryId,
//         "store_id": storeId,
//         "item_name": itemName,
//         "item_price": itemPrice,
//         "item_publish": itemPublish,
//         "organic_image": organicImage,
//         "quantity": quantity,
//         "dis_item_price": disItemPrice,
//         "item_image": itemImage,
//         "item_weight": itemWeight,
//         "item_expiry_date":
//             "${itemExpiryDate.year.toString().padLeft(4, '0')}-${itemExpiryDate.month.toString().padLeft(2, '0')}-${itemExpiryDate.day.toString().padLeft(2, '0')}",
//         "item_description": itemDescription,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_at": deletedAt,
//         "rating": rating,
//       };
// }

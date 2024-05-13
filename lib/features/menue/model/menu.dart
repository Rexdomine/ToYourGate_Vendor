// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  List<Datum>? data;

  MenuModel({
    this.data,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? description;
  int? quantity;
  int? price;
  int? minQty;
  int? maxQty;
  int? shopId;
  String? image;
  String? status;
  List<dynamic>? addons;
  String? shopName;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.minQty,
    this.maxQty,
    this.shopId,
    this.image,
    this.status,
    this.addons,
    this.shopName,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        shopId: json["shop_id"],
        image: json["image"],
        status: json["status"],
        addons: json["addons"] == null
            ? []
            : List<dynamic>.from(json["addons"]!.map((x) => x)),
        shopName: json["shop_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "quantity": quantity,
        "price": price,
        "min_qty": minQty,
        "max_qty": maxQty,
        "shop_id": shopId,
        "image": image,
        "status": status,
        "addons":
            addons == null ? [] : List<dynamic>.from(addons!.map((x) => x)),
        "shop_name": shopName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class AddonClass {
  int? id;
  String? name;
  String? description;
  String? price;
  int? quantity;
  dynamic image;
  String? shopId;

  AddonClass({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.image,
    this.shopId,
  });

  factory AddonClass.fromJson(Map<String, dynamic> json) => AddonClass(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        image: json["image"],
        shopId: json["shop_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "image": image,
        "shop_id": shopId,
      };
}

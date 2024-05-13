// To parse this JSON data, do
//
//     final addonsModel = addonsModelFromJson(jsonString);

import 'dart:convert';

AddonsModel addonsModelFromJson(String str) => AddonsModel.fromJson(json.decode(str));

String addonsModelToJson(AddonsModel data) => json.encode(data.toJson());

class AddonsModel {
    List<Datum>? data;

    AddonsModel({
        this.data,
    });

    factory AddonsModel.fromJson(Map<String, dynamic> json) => AddonsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? name;
    String? description;
    String? price;
    int? quantity;
    dynamic image;
    String? shopId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.name,
        this.description,
        this.price,
        this.quantity,
        this.image,
        this.shopId,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        image: json["image"],
        shopId: json["shop_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "image": image,
        "shop_id": shopId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

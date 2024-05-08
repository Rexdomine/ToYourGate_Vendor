// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    Data? data;

    ProfileModel({
        this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    String? shopPhone;
    String? description;
    String? category;
    String? logo;
    String? background;
    String? minDeliveryPrice;
    String? priceKm;
    String? deliveryTime;
    String? minAmount;
    String? tax;
    String? commission;
    String? address;
    String? firstname;
    String? lastname;
    String? email;
    String? phone;
    String? long;
    String? lat;
    dynamic status;
    dynamic otp;
    String? deviceToken;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.name,
        this.shopPhone,
        this.description,
        this.category,
        this.logo,
        this.background,
        this.minDeliveryPrice,
        this.priceKm,
        this.deliveryTime,
        this.minAmount,
        this.tax,
        this.commission,
        this.address,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.long,
        this.lat,
        this.status,
        this.otp,
        this.deviceToken,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        shopPhone: json["shop_phone"],
        description: json["description"],
        category: json["category"],
        logo: json["logo"],
        background: json["background"],
        minDeliveryPrice: json["min_delivery_price"],
        priceKm: json["price_km"],
        deliveryTime: json["delivery_time"],
        minAmount: json["min_amount"],
        tax: json["tax"],
        commission: json["commission"],
        address: json["address"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        long: json["long"],
        lat: json["lat"],
        status: json["status"],
        otp: json["otp"],
        deviceToken: json["device_token"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shop_phone": shopPhone,
        "description": description,
        "category": category,
        "logo": logo,
        "background": background,
        "min_delivery_price": minDeliveryPrice,
        "price_km": priceKm,
        "delivery_time": deliveryTime,
        "min_amount": minAmount,
        "tax": tax,
        "commission": commission,
        "address": address,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "long": long,
        "lat": lat,
        "status": status,
        "otp": otp,
        "device_token": deviceToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

// To parse this JSON data, do
//
//     final activeOrderModel = activeOrderModelFromJson(jsonString);

import 'dart:convert';

ActiveOrderModel activeOrderModelFromJson(String str) => ActiveOrderModel.fromJson(json.decode(str));

String activeOrderModelToJson(ActiveOrderModel data) => json.encode(data.toJson());

class ActiveOrderModel {
    List<Datum>? data;

    ActiveOrderModel({
        this.data,
    });

    factory ActiveOrderModel.fromJson(Map<String, dynamic> json) => ActiveOrderModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? userId;
    String? orderId;
    String? shopId;
    dynamic deliveryId;
    OrderDetails? orderDetails;
    Customer? customer;
    dynamic delivery;
    String? status;
    String? totalAmount;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? shop;
    String? unitTotal;
    Address? address;
    List<dynamic>? allergies;

    Datum({
        this.id,
        this.userId,
        this.orderId,
        this.shopId,
        this.deliveryId,
        this.orderDetails,
        this.customer,
        this.delivery,
        this.status,
        this.totalAmount,
        this.createdAt,
        this.updatedAt,
        this.shop,
        this.unitTotal,
        this.address,
        this.allergies,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        shopId: json["shop_id"],
        deliveryId: json["delivery_id"],
        orderDetails: json["order_details"] == null ? null : OrderDetails.fromJson(json["order_details"]),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        delivery: json["delivery"],
        status: json["status"],
        totalAmount: json["total_amount"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        shop: json["shop"],
        unitTotal: json["unit_total"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        allergies: json["allergies"] == null ? [] : List<dynamic>.from(json["allergies"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "shop_id": shopId,
        "delivery_id": deliveryId,
        "order_details": orderDetails?.toJson(),
        "customer": customer?.toJson(),
        "delivery": delivery,
        "status": status,
        "total_amount": totalAmount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shop": shop,
        "unit_total": unitTotal,
        "address": address?.toJson(),
        "allergies": allergies == null ? [] : List<dynamic>.from(allergies!.map((x) => x)),
    };
}

class Address {
    String? address;
    double? latitude;
    double? longitude;
    dynamic name;

    Address({
        this.address,
        this.latitude,
        this.longitude,
        this.name,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
    };
}

class Customer {
    String? name;
    String? email;
    String? phone;
    String? address;
    dynamic image;
    String? latitude;
    String? longitude;

    Customer({
        this.name,
        this.email,
        this.phone,
        this.address,
        this.image,
        this.latitude,
        this.longitude,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class OrderDetails {
    int? menuId;
    String? quantity;
    String? price;
    String? image;
    String? name;
    String? description;

    OrderDetails({
        this.menuId,
        this.quantity,
        this.price,
        this.image,
        this.name,
        this.description,
    });

    factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        menuId: json["menu_id"],
        quantity: json["quantity"],
        price: json["price"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "menu_id": menuId,
        "quantity": quantity,
        "price": price,
        "image": image,
        "name": name,
        "description": description,
    };
}

// To parse this JSON data, do
//
//     final ondGoOrderModel = ondGoOrderModelFromJson(jsonString);

import 'dart:convert';

OndGoOrderModel ondGoOrderModelFromJson(String str) => OndGoOrderModel.fromJson(json.decode(str));

String ondGoOrderModelToJson(OndGoOrderModel data) => json.encode(data.toJson());

class OndGoOrderModel {
    List<dynamic>? data;

    OndGoOrderModel({
        this.data,
    });

    factory OndGoOrderModel.fromJson(Map<String, dynamic> json) => OndGoOrderModel(
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}

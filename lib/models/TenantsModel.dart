// To parse this JSON data, do
//
//     final tenantsModel = tenantsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TenantsModel> tenantsModelFromJson(String str) => List<TenantsModel>.from(json.decode(str).map((x) => TenantsModel.fromJson(x)));

String tenantsModelToJson(List<TenantsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TenantsModel {
    final String id;
    final String name;
    final String address;
    final String email;
    final String phone;
    final String password;
    final String profile;
    final Property property;
    final String landlord;
    final int monthlyRent;
    final int powerFee;
    final int powerStatus;
    final int otp;
    final String fcmToken;
    final bool isEmailVerified;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    TenantsModel({
        required this.id,
        required this.name,
        required this.address,
        required this.email,
        required this.phone,
        required this.password,
        required this.profile,
        required this.property,
        required this.landlord,
        required this.monthlyRent,
        required this.powerFee,
        required this.powerStatus,
        required this.otp,
        required this.fcmToken,
        required this.isEmailVerified,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory TenantsModel.fromJson(Map<String, dynamic> json) => TenantsModel(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        profile: json["profile"],
        property: Property.fromJson(json["property"]),
        landlord: json["landlord"],
        monthlyRent: json["monthly_rent"],
        powerFee: json["power_fee"],
        powerStatus: json["power_status"],
        otp: json["otp"],
        fcmToken: json["fcm_token"],
        isEmailVerified: json["isEmailVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "email": email,
        "phone": phone,
        "password": password,
        "profile": profile,
        "property": property.toJson(),
        "landlord": landlord,
        "monthly_rent": monthlyRent,
        "power_fee": powerFee,
        "power_status": powerStatus,
        "otp": otp,
        "fcm_token": fcmToken,
        "isEmailVerified": isEmailVerified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Property {
    final String id;
    final String name;
    final String address;
    final int floors;
    final String landlord;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Property({
        required this.id,
        required this.name,
        required this.address,
        required this.floors,
        required this.landlord,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        floors: json["floors"],
        landlord: json["landlord"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "floors": floors,
        "landlord": landlord,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

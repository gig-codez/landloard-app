
import 'dart:convert';

List<PropertiesModel> propertiesModelFromJson(String str) => List<PropertiesModel>.from(json.decode(str).map((x) => PropertiesModel.fromJson(x)));

String propertiesModelToJson(List<PropertiesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertiesModel {
    final String id;
    final String name;
    final String address;
    final int floors;
    final String landlord;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    PropertiesModel({
        required this.id,
        required this.name,
        required this.address,
        required this.floors,
        required this.landlord,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory PropertiesModel.fromJson(Map<String, dynamic> json) => PropertiesModel(
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

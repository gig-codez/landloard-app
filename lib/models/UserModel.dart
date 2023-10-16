
import 'dart:convert';

LandlordModel landlordModelFromJson(String str) => LandlordModel.fromJson(json.decode(str));

String landlordModelToJson(LandlordModel data) => json.encode(data.toJson());

class LandlordModel {
    final String userId;
    final String token;
    final String email;
    final String name;

    LandlordModel({
        required this.userId,
        required this.token,
        required this.email,
        required this.name,
    });

    factory LandlordModel.fromJson(Map<String, dynamic> json) => LandlordModel(
        userId: json["userId"],
        token: json["token"],
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "token": token,
        "email": email,
        "name": name,
    };
}

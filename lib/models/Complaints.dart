// To parse this JSON data, do
//
//     final complaintsModel = complaintsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ComplaintsModel> complaintsModelFromJson(String str) =>
    List<ComplaintsModel>.from(
        json.decode(str).map((x) => ComplaintsModel.fromJson(x)));

String complaintsModelToJson(List<ComplaintsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplaintsModel {
  final String id;
  final String tenant;
  final String property;
  final String complaintName;
  final String complaintDescription;
  final String complaintStatus;
  final String complaintImage;
  final String reason;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ComplaintsModel({
    required this.id,
    required this.tenant,
    required this.property,
    required this.complaintName,
    required this.complaintDescription,
    required this.complaintStatus,
    required this.complaintImage,
    required this.reason,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ComplaintsModel.fromJson(Map<String, dynamic> json) =>
      ComplaintsModel(
        id: json["_id"],
        tenant: json["tenant"],
        property: json["property"],
        complaintName: json["complaint_name"],
        complaintDescription: json["complaint_description"],
        complaintStatus: json["complaint_status"],
        complaintImage: json["complaint_image"],
        reason: json["reason"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tenant": tenant,
        "property": property,
        "complaint_name": complaintName,
        "complaint_description": complaintDescription,
        "complaint_status": complaintStatus,
        "complaint_image": complaintImage,
        "reason": reason,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

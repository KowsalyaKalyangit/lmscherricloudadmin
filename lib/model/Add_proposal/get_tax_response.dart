// To parse this JSON data, do
//
//     final drpDwnModel = drpDwnModelFromJson(jsonString);

import 'dart:convert';

DrpDwnModel drpDwnModelFromJson(String str) =>
    DrpDwnModel.fromJson(json.decode(str));

String drpDwnModelToJson(DrpDwnModel data) => json.encode(data.toJson());

class DrpDwnModel {
  int success;
  String status;
  String message;
  int total;
  List<Datum> data;

  DrpDwnModel({
    required this.success,
    required this.status,
    required this.message,
    required this.total,
    required this.data,
  });

  factory DrpDwnModel.fromJson(Map<String, dynamic> json) => DrpDwnModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        total: json["Total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "Total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String name;
  String taxrate;
  bool bval = false;

  Datum({
    required this.id,
    required this.name,
    required this.taxrate,
    required this.bval,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      id: json["id"],
      name: json["name"],
      taxrate: json["taxrate"],
      bval: false);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "taxrate": taxrate, "bval": bval};
}
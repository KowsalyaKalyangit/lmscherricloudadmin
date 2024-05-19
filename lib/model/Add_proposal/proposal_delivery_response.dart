// To parse this JSON data, do
//
//     final proposalDeliveryModel = proposalDeliveryModelFromJson(jsonString);

import 'dart:convert';

ProposalDeliveryModel proposalDeliveryModelFromJson(String str) => ProposalDeliveryModel.fromJson(json.decode(str));

String proposalDeliveryModelToJson(ProposalDeliveryModel data) => json.encode(data.toJson());

class ProposalDeliveryModel {
    int success;
    String status;
    String message;
    int totalLiftDelivery;
    List<Datum> data;

    ProposalDeliveryModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftDelivery,
        required this.data,
    });

    factory ProposalDeliveryModel.fromJson(Map<String, dynamic> json) => ProposalDeliveryModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftDelivery: json["TotalLiftDelivery"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftDelivery": totalLiftDelivery,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String deliveryid;
    String name;

    Datum({
        required this.deliveryid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        deliveryid: json["deliveryid"]??'',
        name: json["name"]??'',
    );

    Map<String, dynamic> toJson() => {
        "deliveryid": deliveryid,
        "name": name,
    };
}

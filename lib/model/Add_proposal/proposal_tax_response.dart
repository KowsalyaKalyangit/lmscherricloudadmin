// To parse this JSON data, do
//
//     final proposalTaskModel = proposalTaskModelFromJson(jsonString);

import 'dart:convert';

ProposalTaskModel proposalTaskModelFromJson(String str) => ProposalTaskModel.fromJson(json.decode(str));

String proposalTaskModelToJson(ProposalTaskModel data) => json.encode(data.toJson());

class ProposalTaskModel {
    int success;
    String status;
    String message;
    int subTotalAmount;
    int totalAmount;
    List<Datum> data;

    ProposalTaskModel({
        required this.success,
        required this.status,
        required this.message,
        required this.subTotalAmount,
        required this.totalAmount,
        required this.data,
    });

    factory ProposalTaskModel.fromJson(Map<String, dynamic> json) => ProposalTaskModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        subTotalAmount: json["SubTotalAmount"],
        totalAmount: json["TotalAmount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "SubTotalAmount": subTotalAmount,
        "TotalAmount": totalAmount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    int taxamount;

    Datum({
        required this.id,
        required this.name,
        required this.taxamount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        taxamount: json["taxamount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "taxamount": taxamount,
    };
}

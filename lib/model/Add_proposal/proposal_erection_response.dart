// To parse this JSON data, do
//
//     final proposalErectionModel = proposalErectionModelFromJson(jsonString);

import 'dart:convert';

ProposalErectionModel proposalErectionModelFromJson(String str) => ProposalErectionModel.fromJson(json.decode(str));

String proposalErectionModelToJson(ProposalErectionModel data) => json.encode(data.toJson());

class ProposalErectionModel {
    int success;
    String status;
    String message;
    int totalLiftErection;
    List<Datum> data;

    ProposalErectionModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftErection,
        required this.data,
    });

    factory ProposalErectionModel.fromJson(Map<String, dynamic> json) => ProposalErectionModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftErection: json["TotalLiftErection"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftErection": totalLiftErection,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String erectionid;
    String name;

    Datum({
        required this.erectionid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        erectionid: json["erectionid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "erectionid": erectionid,
        "name": name,
    };
}

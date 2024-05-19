// To parse this JSON data, do
//
//     final proposalUpdateModel = proposalUpdateModelFromJson(jsonString);

import 'dart:convert';

ProposalUpdateModel proposalUpdateModelFromJson(String str) => ProposalUpdateModel.fromJson(json.decode(str));

String proposalUpdateModelToJson(ProposalUpdateModel data) => json.encode(data.toJson());

class ProposalUpdateModel {
    int success;
    String status;
    String message;
    String emptyField;
    List<Datum> data;

    ProposalUpdateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.emptyField,
        required this.data,
    });

    factory ProposalUpdateModel.fromJson(Map<String, dynamic> json) => ProposalUpdateModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        emptyField: json["EmptyField"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "EmptyField": emptyField,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String proposalid;

    Datum({
        required this.proposalid,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        proposalid: json["proposalid"],
    );

    Map<String, dynamic> toJson() => {
        "proposalid": proposalid,
    };
}

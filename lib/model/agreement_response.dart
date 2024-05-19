// To parse this JSON data, do
//
//     final agreementModel = agreementModelFromJson(jsonString);

import 'dart:convert';

AgreementModel agreementModelFromJson(String str) => AgreementModel.fromJson(json.decode(str));

String agreementModelToJson(AgreementModel data) => json.encode(data.toJson());

class AgreementModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AgreementModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AgreementModel.fromJson(Map<String, dynamic> json) => AgreementModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String link;

    Datum({
        required this.link,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
    };
}

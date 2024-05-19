// To parse this JSON data, do
//
//     final leadsViewModel = leadsViewModelFromJson(jsonString);

import 'dart:convert';

LeadsViewModel leadsViewModelFromJson(String str) => LeadsViewModel.fromJson(json.decode(str));

String leadsViewModelToJson(LeadsViewModel data) => json.encode(data.toJson());

class LeadsViewModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    LeadsViewModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory LeadsViewModel.fromJson(Map<String, dynamic> json) => LeadsViewModel(
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

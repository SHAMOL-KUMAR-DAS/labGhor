import 'dart:convert';

ViewDiagnosticResponse viewDiagnosticResponseFromJson(String str) => ViewDiagnosticResponse.fromJson(json.decode(str));

String viewDiagnosticResponseToJson(ViewDiagnosticResponse data) => json.encode(data.toJson());

class ViewDiagnosticResponse {
  ViewDiagnosticResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<DiagnosticData> data;

  factory ViewDiagnosticResponse.fromJson(Map<String, dynamic> json) => ViewDiagnosticResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<DiagnosticData>.from(json["data"].map((x) => DiagnosticData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result ?? '',
    "mgs": mgs ?? '',
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DiagnosticData {
  DiagnosticData({
    this.id,
    this.name,
    this.branchName,
    this.merchantId,
    this.contactMobile,
    this.district,
    this.thana,
    this.fullAddress,
  });

  var id;
  var name;
  var branchName;
  var merchantId;
  var contactMobile;
  var district;
  var thana;
  var fullAddress;

  factory DiagnosticData.fromJson(Map<String, dynamic> json) => DiagnosticData(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    branchName: json["branch_name"] ?? '',
    merchantId: json["merchant_id"] ?? '',
    contactMobile: json["contact_mobile"] ?? '',
    district: json["district"] ?? '',
    thana: json["thana"] ?? '',
    fullAddress: json["full_address"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "branch_name": branchName,
    "merchant_id": merchantId,
    "contact_mobile": contactMobile,
    "district": district,
    "thana": thana,
    "full_address": fullAddress,
  };
}

import 'dart:convert';

MyTestOrderListResponse myTestOrderListResponseFromJson(String str) => MyTestOrderListResponse.fromJson(json.decode(str));

String myTestOrderListResponseToJson(MyTestOrderListResponse data) => json.encode(data.toJson());

class MyTestOrderListResponse {
  MyTestOrderListResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<TestOrderListData> data;

  factory MyTestOrderListResponse.fromJson(Map<String, dynamic> json) => MyTestOrderListResponse(
    result: json["result"] ?? '',
    mgs: json["mgs"] ?? '',
    data: List<TestOrderListData>.from(json["data"].map((x) => TestOrderListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TestOrderListData {
  TestOrderListData({
    this.dateTime,
    this.invoice,
    this.diagnostic,
    this.patientName,
    this.status,
  });

  var dateTime;
  var invoice;
  var diagnostic;
  var patientName;
  var status;

  factory TestOrderListData.fromJson(Map<String, dynamic> json) => TestOrderListData(
    dateTime: DateTime.parse(json["date_time"]),
    invoice: json["invoice"] ?? '',
    diagnostic: json["diagnostic"] ?? '',
    patientName: json["patient_name"] ?? '',
    status: json["status"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "date_time": dateTime.toIso8601String(),
    "invoice": invoice,
    "diagnostic": diagnostic,
    "patient_name": patientName,
    "status": status,
  };
}

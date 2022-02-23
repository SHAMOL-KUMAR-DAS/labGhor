import 'dart:convert';

ShowTestDetailResponse showTestDetailResponseFromJson(String str) => ShowTestDetailResponse.fromJson(json.decode(str));

String showTestDetailResponseToJson(ShowTestDetailResponse data) => json.encode(data.toJson());

class ShowTestDetailResponse {
  ShowTestDetailResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<TestDetailData> data;

  factory ShowTestDetailResponse.fromJson(Map<String, dynamic> json) => ShowTestDetailResponse(
    result: json["result"] ?? '',
    mgs: json["mgs"] ?? '',
    data: List<TestDetailData>.from(json["data"].map((x) => TestDetailData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TestDetailData {
  TestDetailData({
    this.testId,
    this.dTestId,
    this.name,
    this.category,
    this.details,
    this.mrp,
    this.sellPrice,
  });

  var testId;
  var dTestId;
  var name;
  var category;
  var details;
  var mrp;
  var sellPrice;

  factory TestDetailData.fromJson(Map<String, dynamic> json) => TestDetailData(
    testId: json["test_id"] ?? '',
    dTestId: json["d_test_id"] ?? '',
    name: json["name"] ?? '',
    category: json["category"] ?? '',
    details: json["details"] ?? '',
    mrp: json["mrp"] ?? '',
    sellPrice: json["sell_price"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "d_test_id": dTestId,
    "name": name,
    "category": category,
    "details": details,
    "mrp": mrp,
    "sell_price": sellPrice,
  };
}

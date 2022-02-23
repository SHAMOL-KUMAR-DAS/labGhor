import 'dart:convert';

ShowTestListResponse showTestListResponseFromJson(String str) => ShowTestListResponse.fromJson(json.decode(str));

String showTestListResponseToJson(ShowTestListResponse data) => json.encode(data.toJson());

class ShowTestListResponse {
  ShowTestListResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<TestListData> data;

  factory ShowTestListResponse.fromJson(Map<String, dynamic> json) => ShowTestListResponse(
    result: json["result"] ?? '',
    mgs: json["mgs"] ?? '',
    data: List<TestListData>.from(json["data"].map((x) => TestListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TestListData {
  TestListData({
    this.testId,
    this.dTestId,
    this.name,
    this.category,
    this.mrp,
    this.sellPrice,
  });

  var testId;
  var dTestId;
  var name;
  var category;
  var mrp;
  var sellPrice;

  factory TestListData.fromJson(Map<String, dynamic> json) => TestListData(
    testId: json["test_id"] ?? '',
    dTestId: json["d_test_id"] ?? '',
    name: json["name"] ?? '',
    category: json["category"] ?? '',
    mrp: json["mrp"] ?? '',
    sellPrice: json["sell_price"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "d_test_id": dTestId,
    "name": name,
    "category": category,
    "mrp": mrp,
    "sell_price": sellPrice,
  };
}

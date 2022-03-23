import 'dart:convert';

TestSuggestProductResponse testSuggestProductResponseFromJson(String str) => TestSuggestProductResponse.fromJson(json.decode(str));

String testSuggestProductResponseToJson(TestSuggestProductResponse data) => json.encode(data.toJson());

class TestSuggestProductResponse {
  TestSuggestProductResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<TestsuggestData> data;

  factory TestSuggestProductResponse.fromJson(Map<String, dynamic> json) => TestSuggestProductResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<TestsuggestData>.from(json["data"].map((x) => TestsuggestData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TestsuggestData {
  TestsuggestData({
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

  factory TestsuggestData.fromJson(Map<String, dynamic> json) => TestsuggestData(
    testId: json["test_id"],
    dTestId: json["d_test_id"],
    name: json["name"],
    category: json["category"],
    mrp: json["mrp"],
    sellPrice: json["sell_price"],
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

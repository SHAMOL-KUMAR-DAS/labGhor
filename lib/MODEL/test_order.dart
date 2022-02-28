import 'dart:convert';

TestOrderResponse testOrderResponseFromJson(String str) => TestOrderResponse.fromJson(json.decode(str));

String testOrderResponseToJson(TestOrderResponse data) => json.encode(data.toJson());

class TestOrderResponse {
  TestOrderResponse({
    this.result,
    this.mgs,
    this.data,
  });

  var result;
  var mgs;
  var data;

  factory TestOrderResponse.fromJson(Map<String, dynamic> json) => TestOrderResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.invoice,
  });

  var invoice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "invoice": invoice,
  };
}

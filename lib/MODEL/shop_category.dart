import 'dart:convert';

ViewShopCategoryResponse viewShopCategoryResponseFromJson(String str) => ViewShopCategoryResponse.fromJson(json.decode(str));

String viewShopCategoryResponseToJson(ViewShopCategoryResponse data) => json.encode(data.toJson());

class ViewShopCategoryResponse {
  ViewShopCategoryResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<Datum> data;

  factory ViewShopCategoryResponse.fromJson(Map<String, dynamic> json) => ViewShopCategoryResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.category,
  });

  var category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
  };
}

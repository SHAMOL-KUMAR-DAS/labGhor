import 'dart:convert';

ShowTestCategoryResponse showTestCategoryResponseFromJson(String str) => ShowTestCategoryResponse.fromJson(json.decode(str));

String showTestCategoryResponseToJson(ShowTestCategoryResponse data) => json.encode(data.toJson());

class ShowTestCategoryResponse {
  ShowTestCategoryResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<CategoryData> data;

  factory ShowTestCategoryResponse.fromJson(Map<String, dynamic> json) => ShowTestCategoryResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryData {
  CategoryData({
    this.category,
  });

  var category;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    category: json["category"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "category": category,
  };
}

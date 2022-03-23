import 'dart:convert';

ShopSuggestProductResponse shopSuggestProductResponseFromJson(String str) => ShopSuggestProductResponse.fromJson(json.decode(str));

String shopSuggestProductResponseToJson(ShopSuggestProductResponse data) => json.encode(data.toJson());

class ShopSuggestProductResponse {
  ShopSuggestProductResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<ShopSuggestData> data;

  factory ShopSuggestProductResponse.fromJson(Map<String, dynamic> json) => ShopSuggestProductResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<ShopSuggestData>.from(json["data"].map((x) => ShopSuggestData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ShopSuggestData {
  ShopSuggestData({
    this.id,
    this.dateTime,
    this.shopId,
    this.name,
    this.category,
    this.mrp,
    this.sellPrice,
    this.stock,
    this.details,
    this.status,
  });

  var id;
  var dateTime;
  var shopId;
  var name;
  var category;
  var mrp;
  var sellPrice;
  var stock;
  var details;
  var status;

  factory ShopSuggestData.fromJson(Map<String, dynamic> json) => ShopSuggestData(
    id: json["id"],
    dateTime: DateTime.parse(json["date_time"]),
    shopId: json["shop_id"],
    name: json["name"],
    category: json["category"],
    mrp: json["mrp"],
    sellPrice: json["sell_price"],
    stock: json["stock"],
    details: json["details"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_time": dateTime.toIso8601String(),
    "shop_id": shopId,
    "name": name,
    "category": category,
    "mrp": mrp,
    "sell_price": sellPrice,
    "stock": stock,
    "details": details,
    "status": status,
  };
}

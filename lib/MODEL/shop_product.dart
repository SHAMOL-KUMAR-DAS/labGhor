import 'dart:convert';

ViewShopProductResponse viewShopProductResponseFromJson(String str) => ViewShopProductResponse.fromJson(json.decode(str));

String viewShopProductResponseToJson(ViewShopProductResponse data) => json.encode(data.toJson());

class ViewShopProductResponse {
  ViewShopProductResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<Datum> data;

  factory ViewShopProductResponse.fromJson(Map<String, dynamic> json) => ViewShopProductResponse(
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

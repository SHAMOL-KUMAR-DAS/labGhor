import 'dart:convert';

List<GetCartItemShop> getCartItemShopFromJson(String str) => List<GetCartItemShop>.from(json.decode(str).map((x) => GetCartItemShop.fromJson(x)));

String getCartItemShopToJson(List<GetCartItemShop> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCartItemShop {
  GetCartItemShop({
    this.dTestId,
    this.diagnosticName,
    this.testName,
    this.category,
    this.qty,
    this.mrp
  });

  var dTestId;
  var diagnosticName;
  var testName;
  var qty;
  var category;
  var mrp;

  factory GetCartItemShop.fromJson(Map<String, dynamic> json) => GetCartItemShop(
    dTestId: json["d_test_id"] ?? '',
    diagnosticName: json["diagnostic_name"] ?? '',
    testName: json["test_name"] ?? '',
    category: json["category"] ?? '',
    qty: json["qty"] ?? '',
    mrp: json["mrp"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "d_test_id": dTestId,
    "diagnostic_name": diagnosticName,
    "test_name": testName,
    "category": category,
    "qty": qty,
    "mrp": mrp
  };
}

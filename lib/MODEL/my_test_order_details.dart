import 'dart:convert';

MyTestOrderDetailsResponse myTestOrderDetailsResponseFromJson(String str) => MyTestOrderDetailsResponse.fromJson(json.decode(str));

String myTestOrderDetailsResponseToJson(MyTestOrderDetailsResponse data) => json.encode(data.toJson());

class MyTestOrderDetailsResponse {
  MyTestOrderDetailsResponse({
    this.result,
    this.mgs,
    this.data,
  });

  var result;
  var mgs;
  var data;

  factory MyTestOrderDetailsResponse.fromJson(Map<String, dynamic> json) => MyTestOrderDetailsResponse(
    result: json["result"] ?? '',
    mgs: json["mgs"] ?? '',
    data: json['data'] != null ? Data.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.testInfo,
    required this.orderStatus,
  });

  var testInfo;
  List<OrderStatus> orderStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    testInfo: TestInfo.fromJson(json["testInfo"]),
    orderStatus: List<OrderStatus>.from(json["orderStatus"].map((x) => OrderStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "testInfo": testInfo.toJson(),
    "orderStatus": List<dynamic>.from(orderStatus.map((x) => x.toJson())),
  };
}

class OrderStatus {
  OrderStatus({
    this.id,
    this.dateTime,
    this.invoice,
    this.status,
    this.note,
  });

  var id;
  var dateTime;
  var invoice;
  var status;
  dynamic note;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    id: json["id"] ?? '',
    dateTime: json['date_time'] != null ? DateTime.parse(json["date_time"]) : null,
    invoice: json["invoice"] ?? '',
    status: json["status"] ?? '',
    note: json["note"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_time": dateTime.toIso8601String(),
    "invoice": invoice,
    "status": status,
    "note": note,
  };
}

class TestInfo {
  TestInfo({
    this.invoice,
    this.name,
    this.mrp,
    this.sellPrice,
  });

  var invoice;
  var name;
  var mrp;
  var sellPrice;

  factory TestInfo.fromJson(Map<String, dynamic> json) => TestInfo(
    invoice: json["invoice"] ?? '',
    name: json["name"] ?? '',
    mrp: json["mrp"] ?? '',
    sellPrice: json["sell_price"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "invoice": invoice,
    "name": name,
    "mrp": mrp,
    "sell_price": sellPrice,
  };
}

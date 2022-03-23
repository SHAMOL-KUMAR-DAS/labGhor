import 'dart:convert';

ActiveOfferResponse activeOfferResponseFromJson(String str) => ActiveOfferResponse.fromJson(json.decode(str));

String activeOfferResponseToJson(ActiveOfferResponse data) => json.encode(data.toJson());

class ActiveOfferResponse {
  ActiveOfferResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<ActiveOfferData> data;

  factory ActiveOfferResponse.fromJson(Map<String, dynamic> json) => ActiveOfferResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<ActiveOfferData>.from(json["data"].map((x) => ActiveOfferData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActiveOfferData {
  ActiveOfferData({
    this.id,
    this.title,
  });

  var id;
  var title;

  factory ActiveOfferData.fromJson(Map<String, dynamic> json) => ActiveOfferData(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

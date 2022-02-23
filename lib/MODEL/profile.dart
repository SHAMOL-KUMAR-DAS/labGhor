import 'dart:convert';

ShowProfileResponse showProfileResponseFromJson(String str) => ShowProfileResponse.fromJson(json.decode(str));

String showProfileResponseToJson(ShowProfileResponse data) => json.encode(data.toJson());

class ShowProfileResponse {
  ShowProfileResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<Datum> data;

  factory ShowProfileResponse.fromJson(Map<String, dynamic> json) => ShowProfileResponse(
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
    this.name,
    this.mobile,
    this.email,
    this.district,
    this.thana,
    this.fullAddress,
  });

  var id;
  var name;
  var mobile;
  dynamic email;
  dynamic district;
  dynamic thana;
  dynamic fullAddress;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    district: json["district"],
    thana: json["thana"],
    fullAddress: json["full_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "district": district,
    "thana": thana,
    "full_address": fullAddress,
  };
}

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.result,
    this.mgs,
    this.data,
  });

  var result;
  var mgs;
  var data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    this.id,
    this.mobile,
    this.name,
    this.token,
    this.role,
  });

  var id;
  var mobile;
  var name;
  var token;
  var role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? '',
    mobile: json["mobile"] ?? '',
    name: json["name"] ?? '',
    token: json["token"] ?? '',
    role: json["role"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mobile": mobile,
    "name": name,
    "token": token,
    "role": role,
  };
}

import 'dart:convert';

TestPackageListResponse testPackageListResponseFromJson(String str) => TestPackageListResponse.fromJson(json.decode(str));

String testPackageListResponseToJson(TestPackageListResponse data) => json.encode(data.toJson());

class TestPackageListResponse {
  TestPackageListResponse({
    this.result,
    this.mgs,
    required this.data,
  });

  var result;
  var mgs;
  List<TestPackageData> data;

  factory TestPackageListResponse.fromJson(Map<String, dynamic> json) => TestPackageListResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: List<TestPackageData>.from(json["data"].map((x) => TestPackageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TestPackageData {
  TestPackageData({
    this.packageId,
    this.name,
    this.image,
  });

  var packageId;
  var name;
  var image;

  factory TestPackageData.fromJson(Map<String, dynamic> json) => TestPackageData(
    packageId: json["package_id"],
    name: json["name"],
    image: json['img'],
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "name": name,
    'img': image
  };
}

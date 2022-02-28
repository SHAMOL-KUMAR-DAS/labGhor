import 'dart:convert';

TestPackageDetailsResponse testPackageDetailsResponseFromJson(String str) => TestPackageDetailsResponse.fromJson(json.decode(str));

String testPackageDetailsResponseToJson(TestPackageDetailsResponse data) => json.encode(data.toJson());

class TestPackageDetailsResponse {
  TestPackageDetailsResponse({
    this.result,
    this.mgs,
    this.data,
  });

  var result;
  var mgs;
  var data;

  factory TestPackageDetailsResponse.fromJson(Map<String, dynamic> json) => TestPackageDetailsResponse(
    result: json["result"],
    mgs: json["mgs"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "mgs": mgs,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.packageInfo,
    required this.testList,
  });

  var packageInfo;
  List<TestList> testList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    packageInfo: PackageInfo.fromJson(json["packageInfo"]),
    testList: List<TestList>.from(json["testList"].map((x) => TestList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "packageInfo": packageInfo.toJson(),
    "testList": List<dynamic>.from(testList.map((x) => x.toJson())),
  };
}

class PackageInfo {
  PackageInfo({
    this.packageId,
    this.name,
    this.mrp,
    this.sellPrice,
    this.details,
  });

  var packageId;
  var name;
  var mrp;
  var sellPrice;
  var details;

  factory PackageInfo.fromJson(Map<String, dynamic> json) => PackageInfo(
    packageId: json["package_id"] ?? '',
    name: json["name"] ?? '',
    mrp: json["mrp"] ?? '',
    sellPrice: json["sell_price"] ?? '',
    details: json["details"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "name": name,
    "mrp": mrp,
    "sell_price": sellPrice,
    "details": details,
  };
}

class TestList {
  TestList({
    this.testId,
    this.testName,
  });

  var testId;
  var testName;

  factory TestList.fromJson(Map<String, dynamic> json) => TestList(
    testId: json["test_id"] ?? '',
    testName: json["test_name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "test_name": testName,
  };
}

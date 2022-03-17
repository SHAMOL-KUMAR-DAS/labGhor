import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_doctor_booking/MODEL/diagnostic.dart';
import 'package:online_doctor_booking/MODEL/login.dart';
import 'package:online_doctor_booking/MODEL/my_test_order_details.dart';
import 'package:online_doctor_booking/MODEL/my_test_order_list.dart';
import 'package:online_doctor_booking/MODEL/shop_category.dart';
import 'package:online_doctor_booking/MODEL/shop_category_product.dart';
import 'package:online_doctor_booking/MODEL/shop_product.dart';
import 'package:online_doctor_booking/MODEL/test_category.dart';
import 'package:online_doctor_booking/MODEL/test_details.dart';
import 'package:online_doctor_booking/MODEL/test_list.dart';
import 'package:online_doctor_booking/MODEL/test_order.dart';
import 'package:online_doctor_booking/MODEL/test_package_details.dart';
import 'package:online_doctor_booking/MODEL/test_package_list.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _baseUrl = 'https://labghorapi.bddaimond.com/api';

//User Registration(/user-reg) - COMPLETE
Future Register(BuildContext context, {name, mobile, password}) async{
  var url = '$_baseUrl/user-reg';
  var response = await http.post(Uri.parse(url), body: {
    'name'      : name,
    'mobile'    : mobile,
    'password'  : password
  });
  if(response.statusCode == 200){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}

//User Login(/user-login) - COMPLETE
Future Login(BuildContext context, {mobile, password, dTestId}) async{
  var url = '$_baseUrl/user-login';
  var response = await http.post(Uri.parse(url), body: {
    'mobile'    : mobile,
    'password'  : password
  });
  if(response.statusCode == 200){
    LoginResponse loginData = loginResponseFromJson(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(loginData.mgs == 'Login Success' )
    {
      String token = await loginData.data.token;
      await prefs.setString('token', token);

      String user_id = await loginData.data.id.toString();
      await prefs.setString('user_id', user_id);

      String name = await loginData.data.name;
      await prefs.setString('user_name', name);

      String mobile = await loginData.data.mobile;
      await prefs.setString('user_mobile', mobile);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => My_Cart(dTestId: dTestId)), (route) => false);
    }

    else
    {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Enter Valid Mobile and Password'),
        );
      });
    };
  }
}

//Profile (/user-info/user_id)
Future Profile() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = (prefs.getString('user_id') ?? '0');
  var token = (prefs.getString('token') ?? '0');

  var url = '$_baseUrl/user-info/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });
}

//Update Profile (/user-profile-update)
Future UpdateProfile({name, mobile, email, district, thana, full_address}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = (prefs.getString('user_id') ?? '0');

  var url = '$_baseUrl/user-profile-update';
  var response = await http.post(Uri.parse(url), body: {
    'user_id'       : user_id,
    'mobile'        : mobile,
    'email'         : email,
    'district'      : district,
    'thana'         : thana,
    'full_address'  : full_address
  });
}

//Thana Wise Diagonstics(diagnostics-list-by-thana/ThanaName) - COMPLETE
Future Diagonstics({thanaName}) async{
  var url = '$_baseUrl/diagnostics-list-by-thana/$thanaName';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ViewDiagnosticResponse diagnosticData = viewDiagnosticResponseFromJson(response.body);
    print(diagnosticData.data[0].id);
    return diagnosticData;
  }
}

//Test Category (/test-category/diagnosticsId) - COMPLETE
Future TestCategory({diagnosticsId}) async{
  var url = '$_baseUrl/test-category/$diagnosticsId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ShowTestCategoryResponse testCategory = showTestCategoryResponseFromJson(response.body);

    return testCategory;
  }
}


//Test Search (/search-test)
Future TestSearch({text, diagnosticId}) async{
  var url = '$_baseUrl/search-test';
  var response = await http.post(Uri.parse(url),body: {
    'search_text' : text,
    'diagnostic_id': diagnosticId
  });

  if(response.statusCode == 200){

  }
}

//Test Details (/test-details/diagnosticTestId) - COMPLETE
Future  TestDetails({diagnosticTestId}) async{
  var url = '$_baseUrl/test-details/$diagnosticTestId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ShowTestDetailResponse testDetail = showTestDetailResponseFromJson(response.body);
    return testDetail;
  }
}

//Test Order (test-order)
Future TestOrder({diagnosticTestId, paymentTx, paymentMethod}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var user_id = (prefs.getString('user_id') ?? '0');
  var user_name = (prefs.getString('user_name') ?? '');
  var user_mobile = (prefs.getString('user_mobile') ?? '');
  paymentTx     = '535345324D3';
  paymentMethod = 'Bkash';

  var url = '$_baseUrl/test-order';
  var response = await http.post(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  }, body: {
    'user_id'               : user_id,
    'payment_txn'           : paymentTx,
    'payment_method'        : paymentMethod,
    'patient_address'       : '',
    'patient_contect_mobile': user_mobile,
    'cart_items'            : user_name,
  });
  
  if(response.statusCode == 200){
    TestOrderResponse testOrder = testOrderResponseFromJson(response.body);
  }
}

//*****************************************************28/02/22*********************************************

//My Test Order List
Future MyTestOrderList() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var user_id = (prefs.getString('user_id') ?? '0');
  var url = '$_baseUrl/my-order-list/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });

  if(response.statusCode == 200){
    MyTestOrderListResponse myTestOrder = myTestOrderListResponseFromJson(response.body);
  }
}

//My Test Order Details
Future MyTestOrderdetails(invoice) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var url = '$_baseUrl/my-order-details/$invoice';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });

  if(response.statusCode == 200){
    MyTestOrderDetailsResponse myTestOrderDetail = myTestOrderDetailsResponseFromJson(response.body);
  }
}

//Test Package List - COMPLETE
Future TestPackageList({diagnosticId}) async{
  var url = '$_baseUrl/diagnostic-wise-package-list/$diagnosticId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    TestPackageListResponse testPackageData = testPackageListResponseFromJson(response.body);

    print(testPackageData.data[0].name);
    return testPackageData;
  }
}

//Test Package Details
Future TestPackageDetails({packageId}) async{
  var url = '$_baseUrl/package-details/$packageId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    TestPackageDetailsResponse testPackageDetailData = testPackageDetailsResponseFromJson(response.body);
    print('************************************************');
    print(testPackageDetailData.data.testList[1].testName);
    return testPackageDetailData;

  }
}

//Package Order
Future PackageOrder({packageId, patientName, patientAddress, patientMobile, patientAge, paymentTxn, paymentMethod}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var user_id = (prefs.getString('user_id') ?? '0');
  var url = '$_baseUrl/package-order';
  var response = await http.post(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  }, body: {
    'user_id'                 : user_id,
    'package_id'              : packageId,
    'patient_name'            : patientName,
    'patient_address'         : patientAddress,
    'patient_contect_mobile'  : patientMobile,
    'patient_age'             : patientAge,
    'payment_txn'             : paymentTxn,
    'payment_method'          : paymentMethod,
  });

  if(response.statusCode == 200){

  }
}

//My Package Order List
Future MyPackageOrderList() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var user_id = (prefs.getString('user_id') ?? '0');
  var url = '$_baseUrl/my-package-order-list/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });

  if(response.statusCode == 200){}
}

//My Package Order Details
Future MyPackageOrderdetails(invoice) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var url = '$_baseUrl/my-package-order-details/$invoice';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });

  if(response.statusCode == 200){}
}

//Shop Product List
Future ShopProductList() async{

  var url = '$_baseUrl/shop-product-list';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ViewShopProductResponse shopData = viewShopProductResponseFromJson(response.body);

    return shopData;
  }
}

//Shop Product Category Wise
Future ShopCategoryProductList({category}) async{

  var url = '$_baseUrl/category-wise-shop-product-list/$category';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    CategoryWiseProductResponse shopCategoryProduct = categoryWiseProductResponseFromJson(response.body);

    return shopCategoryProduct;
  }
}

//Shop Category List
Future ShopCategoryList() async{

  var url = '$_baseUrl/shop-product-category';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ViewShopCategoryResponse shopCategoryData = viewShopCategoryResponseFromJson(response.body);

    return shopCategoryData;
  }
}
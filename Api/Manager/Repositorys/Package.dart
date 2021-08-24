import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wirless_wifi/Api/Manager/Models/Package.dart';

import 'Network.dart';
import 'User.dart';
import 'package:http/http.dart' as http;

final PackageApi packageApi = new PackageApi();
bool checkeDatat = false;

class PackageApi {
  postPackage(String Package_Price, network) async {
    var baseURL = Uri.parse('$uri/package/create');
    try {
      var body =
          json.encode({"Package_Price": Package_Price, "network": network});

      var response = await http.post(
        baseURL,
        body: body,
        headers: headers,
      );
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('تم ارسال الباقة بنجاح');
      }
      var idPackage = responseJson["id"];

      print(idPackage);
   
      
      return response;
    } catch (e) {
    
      print('هناك خطاء' + '$e');
    }
  }

  postdetailsPackage(
    String Package_data,
    Package_time,
    Package_validity,
    details_time,
    details_validity,
    details_data,
    networkId,
    Package_PriceId,
    User_initiate,
    id,
    bool isAdd
  ) async {
    var baseURL = Uri.parse('$uri/package/create/$id');
    try {
      var body = json.encode({
        "Package_data": Package_data,
        "Package_time": Package_time,
        "Package_validity": Package_validity,
        "details_time": details_time,
        "details_validity": details_validity,
        "details_data": details_data,
        "networkId": networkId,
        "Package_PriceId": Package_PriceId,
        "User_initiate": User_initiate,
         "isAdd":isAdd
      });

      var response = await http.post(
        baseURL,
        body: body,
        headers: headers,
      );
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('تم ارسال الباقة بنجاح');
      }
      var idPackage = responseJson["id"];
      print(idPackage);

      return response;
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }

  Future<List<PackagePriceId>?> getPackagePrice(String id) async {
    var baseURL = Uri.parse('$uri/package/price/$id');
    try {
      List<PackagePriceId> packagePriceId = [];
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      packagePriceId = list.map((model) => PackagePriceId.fromJson(model)).toList();
      print(packagePriceId.length);
      print('تم الحصول علا البيانات بنجاح');
      checkeDatat = false;
      return packagePriceId;
    } catch (e) {
      checkeDatat = true;
      print("$e هنالك خطاء");
    }
    return null;
  }

  Future<List<Package>?> getAllPackagePrice(String id) async {
    var baseURL = Uri.parse('$uri/package/$id');
    try {
      List<Package> package = [];
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      package = list.map((model) => Package.fromJson(model)).toList();
      print(package.length);
      print('تم الحصول علا البيانات بنجاح');
      checkeDatat = false;
      return package;
    } catch (e) {
      checkeDatat = true;
      print("$e هنالك خطاء");
    }
    return null;
  }

  updatePackage(String id, package_price) async {
    var baseURL = Uri.parse('$uri/package/update/price/$id');
    try {
      var body = json.encode({
        "Package_Price": package_price,
      });
      await http.patch(
        baseURL,
        body: body,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
      );
    } catch (e) {
      print('$eهناك خطاء');
    }
  }

  deletePackagePrice(PackagePriceId packagePrice) async {
    var baseURL = Uri.parse('$uri/package/${packagePrice.id}');
    await http.delete(
      baseURL,
      headers: headers,
    );
  }
}

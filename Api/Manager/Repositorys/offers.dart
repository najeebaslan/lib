import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wirless_wifi/Api/Manager/Models/offers.dart';

import 'Network.dart';
import 'User.dart';

OffersApi Offersapi = OffersApi();

class OffersApi {
  postOffers(
    String package,
    offers,
    Package_data,
    details_data,
    Package_time,
    details_time,
    Package_validity,
    details_validity,
    limiteUptime,
    details_limiteUptime,
    networkId,
  ) async {
    var baseURL = Uri.parse('$uri/offer/offer');
    try {
      var body = json.encode({
        "package": package,
        "offers": offers,
        "Package_data": Package_data,
        "details_data": details_data,
        "Package_time": Package_time,
        "details_time": details_time,
        "Package_validity": Package_validity,
        "details_validity": details_validity,
        "limiteUptime": limiteUptime,
        "details_limiteUptime": details_limiteUptime,
        "networkId": networkId,
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
      var data = responseJson;

      print(data);

      return response;
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }

  getOffers(idnetwork) async {
    var baseURL = Uri.parse('$uri/offer/$idnetwork');

    try {
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      late final networks =
          list.map((model) => Offers.fromJson(model)).toList();
      print(networks.length);

      return networks;
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
  }
  getAllOffers() async {
    var baseURL = Uri.parse('$uri/offer');

    try {
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      late final networks =
          list.map((model) => Offers.fromJson(model)).toList();
      print(networks.length);

      return networks;
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
  }
}

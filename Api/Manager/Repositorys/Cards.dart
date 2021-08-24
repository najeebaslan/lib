import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wirless_wifi/Api/Manager/Models/Cards.dart';

import 'Network.dart';
import 'User.dart';

final CardsApi Cardsapi = new CardsApi();

class CardsApi {
  

  getCards() async {
    var baseURL = Uri.parse('$uri/csv/60933b2dbc58793b9c910991');
    print(baseURL);
    try {
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      late final users = list.map((model) => Cards.fromJson(model)).toList();
      print(users.length);
      return users;
      // forEach((post) {
      //   username = post.username;
      // });
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
    return null;
  }
}

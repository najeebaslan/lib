import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wirless_wifi/Api/Client/Models_Client/Network.dart';
import 'package:wirless_wifi/Api/Manager/Repositorys/Network.dart';
import 'package:wirless_wifi/Api/Manager/Repositorys/User.dart';


final NetworkClientApi networkClientApi = new NetworkClientApi();

class NetworkClientApi {
  Future<List<Network>?> getAllNetwork() async {
    
    var baseURL = Uri.parse('$uri/network');
    try {
      List<Network> networkClient = [];
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      networkClient = list.map((model) => Network.fromJson(model)).toList();
      print(networkClient.length);
      print('تم الحصول علا البيانات بنجاح');
      // var lshh = list['Allcaverage_erea'][0];
      // print(lshh);
      return networkClient;
    } catch (e) {
      print("$e هنالك خطاء");
    }
    return null;
  }
}

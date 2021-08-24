import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wirless_wifi/Api/Manager/Models/Caverageerea.dart';
import 'Network.dart';
import 'User.dart';

final AllEreaApi allEreaApi = new AllEreaApi();

class AllEreaApi {
  Future<http.Response?> postCaverageErea(
      String Allcaverage_erea, networkid) async {

    try {
      var body = json.encode(
          {"Allcaverage_erea": Allcaverage_erea, "networkid": networkid});

      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
            "Access-Control-Allow-Origin: *"
      };
      final response =
          await http.post(Uri.parse('$uri/erea'), body: body, headers: header);
      final responseJson = json.decode(response.body);
      var res =  response.reasonPhrase;
      print(res);
      if (response.statusCode == 200) {
        print('تم ارسال بيانات المنطقة بنجاح');
      }
      print(responseJson);
      var idErea = responseJson["id"];
      print(idErea);
     
      return response;
    } catch (e) {
      print('هناك خطاء $e');
    }
    return null;
  }

  Future<List<EreaNotidnetwork>?> getCaverageerea(String id) async {
    var baseURL = Uri.parse('$uri/erea/$id');
    try {
      List<EreaNotidnetwork> users = [];
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      users = list.map((model) => EreaNotidnetwork.fromJson(model)).toList();
      print(users.length);
      print('تم الحصول علا البيانات بنجاح');
      return users;
    } catch (e) {
      print("$e هنالك خطاء");
    }
    return null;
  }

  updateAllcaverage(String allcaverage_erea, id) async {
    var baseURL = Uri.parse('$uri/erea/$id');
    try {
      var body = json.encode({
        "Allcaverage_erea": allcaverage_erea,
      });
      // String body = json.encode(updateAllerea.toJson());
      print(body);
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

  deleteAllcaverage(Allcaverage_erea deleteAllErea) async {
    var baseURL = Uri.parse('$uri/erea/${deleteAllErea.id}');
    await http.delete(
      baseURL,
      headers: headers,
    );
  }
}

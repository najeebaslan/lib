 import 'package:wirless_wifi/Api/Manager/Models/Governorate%20.dart';


import 'Network.dart';
 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
final Governorates GovernorateApi = new Governorates();
class Governorates { 

  Future<List<Governorate>?> getPackagePrice() async {
    var baseURL = Uri.parse('$uri/erea/governorate/all');
    try {
      List<Governorate> governorate = [];
      var response = await http.get(
        baseURL,
        headers: headers,
      );
      List list = jsonDecode(response.body);
      governorate = list.map((model) => Governorate.fromJson(model)).toList();
      print(governorate.length);
      print('تم الحصول علا البيانات بنجاح');
      
      return governorate;
    } catch (e) {
 
      print("$e هنالك خطاء");
    }
    return null;
  }
    static Future<List<Governorate>> getGovernorate(String query) async {
    final url = Uri.parse('$uri/erea/governorate/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Governorate.fromJson(json)).where((user) {
        final nameLower = user.governorate.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
  }
 
 

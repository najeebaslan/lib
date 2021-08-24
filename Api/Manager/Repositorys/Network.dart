import 'dart:convert';
import 'package:http/http.dart' as http;
//save id user in SharedPreferences
var networkId;
String uri = "http://172.16.0.8:3000";
// String uri = "http://naeebaslan.com:3000";فتح التطبيق مجان عبر الشبكة
// String uri = "http://7444062152f2.sn.mynetname.net:250"; فتح التطبيق مجان عبر البيانات

final NetworkApi net = new NetworkApi();

class NetworkApi {
  postCreatNetwork(
    String nameA,
    nameE,
    iamge,
    address,
    User_initiate,
    Phones,
    Governorate,
    City,
    Maintenancephone,
  ) async {
    var baseURL = Uri.parse('$uri/network/create');
    try {
      var response = http.MultipartRequest('POST', baseURL);
      response.fields.addAll({
        "nameA": nameA,
        "nameE": nameE,
        "address": address,
        "User_initiate": User_initiate,
        "Phones": Phones,
        "Governorate": Governorate,
        "City": City,
        "Maintenancephone": Maintenancephone,
      });

      response.files.add(await http.MultipartFile.fromPath('img', iamge));
      http.StreamedResponse response1 = await response.send();
      if (response1.statusCode == 200) {
        print('تم ارسال  بيانات الشبكة بنجاح');
        final responsedata =
            json.decode(await response1.stream.bytesToString());
        networkId = responsedata['id'];
        print("${networkId}id الشبكة");
      } else {
        print(response1.reasonPhrase);
      }
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }
}

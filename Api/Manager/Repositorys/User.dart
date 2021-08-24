import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wirless_wifi/UI/Manager/widget/Drawer/networkProfile.dart';
import 'package:wirless_wifi/UI/Manager/widget/Pages/First_Screen/FirstScreen.dart';
import 'Network.dart';

//save id user in SharedPreferences
var userId;
// var Userid;
UserApi Userapi = UserApi();

class UserApi {
  postUserRegstar(
    int userType,
    String 
    name,
    sex,
    password,
    username,
    phone,
    numberAcount,
    BuildContext context,
    contextSnackbar,
  ) async {
    var baseURL = Uri.parse('$uri/user/regstar');
    try {
      var body = json.encode({
        "name": name,
        "phone": phone,
        "userType": userType,
        "sex": sex,
        "username": username,
        "password": password,
        "numberAcount": numberAcount,
      });

      var response = await http.post(
        baseURL,
        body: body,
        headers: headers,
      );

      final responseJson = json.decode(response.body);
      var userid = responseJson["id"];
      userId = userid;
      var userstatus = responseJson["status"];
      var error = responseJson["error"];
    
      if (userstatus == true) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(),
          ),
        );
      } else {
        Navigator.pop(context);

        ScaffoldMessenger.of(contextSnackbar)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            backgroundColor: Colors.deepOrange,
            padding: EdgeInsets.only(
              left: 120,
            ),
            content: Text(
              error.toString(),
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ));
      }
      userId = userid;
      print(userId);
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }

  postUserLogin(
    String password,
    username,
    BuildContext context,
    contextSnackbar,
  ) async {
    var baseURL = Uri.parse('$uri/user/Login');

    try {
      var body = json.encode({
        "username": username,
        "password": password,
      });

      var response = await http.post(
        baseURL,
        body: body,
        headers: headers,
      );

      final responseJson = json.decode(response.body);
      var userlogin = responseJson["status"];
      var userid = responseJson["idUser"];
      networkId = responseJson["NetworkId"][0];
      userId = userid;
      print(userId);
      print(userlogin.toString());
      if (userlogin == true) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrawerWithAppBar(),
          ),
        );
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(contextSnackbar)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            backgroundColor: Colors.deepOrange,
            padding: EdgeInsets.only(left: 55, right: 1),
            content: Text(
              userlogin.toString(),
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ));
      }
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }
}

Map<String, String> headers = {
  "Content-type": "application/json",
  "Accept": "application/json"
      "Access-Control-Allow-Origin: *"
};

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool isLogin = false;
String name = "", myTask = "";
List datas = [];

// This is Controller for variables TextFormField

List<String> allcaverageErea11 = [];

bool errorlanguage = true;
bool sizeicon = true;
bool sizeicon4 = true;
bool sizeicon1 = true;
bool sizeicon2 = false;
bool sizeicon3 = true;
Color color1 = Colors.grey;
Color color = Colors.grey;

void showDefaultSnackbar(
  BuildContext context,
  String error,
) {
  Scaffold.of(
    context,
  ).showSnackBar(
    SnackBar(
      content: Text(error),
      action: SnackBarAction(
        label: 'اتصال با الشبكة',
        onPressed: () {},
      ),
    ),
  );
}

//This is cuntter for ShowCase
final keyOne = GlobalKey();
final keyTwo = GlobalKey();
final keyThree = GlobalKey();
final keyFour = GlobalKey();

const bool loading = true;
const bool loading1 = false;
const bool loading2 = false;
//This is index  timeline
int processIndex = 0;

const kTileHeight = 50.0;
const completeColor = Color(0xFF318AFF);
const inProgressColor = Color(0xFF04A030);
const todoColor = Color(0xFF7F818D);
final processes = [
  'الموقع العام',
  'اماكن التغطية',
  'اسعار الباقات',
  'تفاصيل الباقات',
];

//This is index color timeline
Color getColor(int index) {
  if (index == processIndex) {
    return inProgressColor;
  } else if (index < processIndex) {
    return completeColor;
  } else {
    return todoColor;
  }
}

late StreamSubscription subscription;

void showConnectivitySnackBar(ConnectivityResult result, BuildContext context) {
  final hasInternet = result != ConnectivityResult.none;
  final message = hasInternet ? 'تم استعادة الاتصال ' : 'لست متصل باالإنترنت ';
  final color = hasInternet ? Colors.green : Colors.red;
  defaultshowSnackBar(message, color, context);
}

var now = DateTime.now();
var lastMidnight = DateTime(now.year, now.month, now.day);
var scaffoldKey = new GlobalKey<ScaffoldState>();
defaultshowSnackBar(String message, Color color, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: color,
    ));
}

//Custom CircularProgressIndicator
buildCircularProgressIndicator() {
  return Center(
    child: const SpinKitThreeBounce(
      color: Colors.blue,
      size: 20,
    ),
  );
}

buildSpinKitWave() {
  return const SpinKitWave(
    type: SpinKitWaveType.center,
    color: Colors.pink,
    size: 30,
  );
}

buildSpinKitCubeGrid() {
  return const SpinKitCubeGrid(
    color: Color(0xFF4875D8),
    size: 35,
  );
}

buildSpinKitFadingGrid() {
  return const SpinKitFadingGrid(
    color: Colors.deepOrange,
    size: 35,
  );
}

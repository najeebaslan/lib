import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../../Api/Manager/Models/Package.dart';
import '../../../../../Api/Manager/Repositorys/Network.dart';
import '../../../../../Api/Manager/Repositorys/Package.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../../UI/Manager/widget/widget_public.dart';
import 'package:http/http.dart' as http;

class Packages_Style extends StatefulWidget {
  final Package package;
  final AnimationController animationController;
  final Animation<double> animation;
  final int index;

  const Packages_Style(
      {Key? key,
      required this.package,
      required this.animationController,
      required this.animation, required this.index})
      : super(key: key);
  @override
  _Packages_StyleState createState() =>
      _Packages_StyleState(package, animationController, animation);
}

class _Packages_StyleState extends State<Packages_Style> {
  final Package package;
  late final AnimationController animationController;
  late final Animation<double> animation;

  _Packages_StyleState(this.package, this.animationController, this.animation);



  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).padding.top + 7;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: Stack(
              children: [
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 12, left: 12),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.indigo.withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <Color>[
                            HexColor('#6F72CA'),
                            HexColor('#5C5EDD'),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 0, right: 0, bottom: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                builddetails(
                                  "الفئة :  ${package.packagePriceId.packagePrice}",
                                  "ريال",
                                ),
                                SizedBox(
                                  height: heigth,
                                ),
                                builddetails(
                                  'الوقت' ' : ${package.packageTime}',
                                  "${package.detailsTime}",
                                ),
                                SizedBox(
                                  height: heigth,
                                ),
                                builddetails(
                                  'البيانات' ': ${package.packageData}',
                                  "${package.detailsData}",
                                ),
                                SizedBox(
                                  height: heigth,
                                ),
                                builddetails(
                                  'الصلاحية' ' : ${package.packageValidity}',
                                  "${package.detailsValidity}",
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    IconButton(
                                        icon: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: Colors.blue[50]),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onPressed: () {
                                          chooseFileUsingFilePicker(package);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -4,
                  right: 110,
                  child: Container(
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ts(
                              "${package.packagePriceId.packagePrice}",
                              const TextStyle(color: Colors.white),
                            ))),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA).withOpacity(0.2),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:
                                Colors.accents[widget.index % Colors.accents.length],
                            //Colors.indigo,
                            offset: const Offset(1.1, 4.0),
                            blurRadius: 0.1),
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  builddetails(String string1, String string2) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ts(
            string1,
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              fontFamily: StyleWidget.fontName,
              // letterSpacing: 0.2,
              color: Color(0xFFFFFFFF),
            ),
          ),
          Text(
            string2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              fontFamily: StyleWidget.fontName,
              letterSpacing: 0.2,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

/////// //////////////// This is for get File csv

  PlatformFile? objFile;

  void chooseFileUsingFilePicker(final Package mealsListData) async {
    var result = await FilePicker.platform.pickFiles(
      withReadStream: true,
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
        objFile != null
            ? builddilog(context, mealsListData).toString()
            // ignore: unnecessary_statements
            : '...';
      });
    }
  }

  void uploadSelectedFile(String packageId, package) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$uri/csv/uploadfile"),
    );

    request.fields["id"] = "abc";
    request.fields.addAll({
      "PackageId": packageId,
    });
    request.files.add(new http.MultipartFile(
        "uploadfile", objFile!.readStream!, objFile!.size!,
        filename: objFile!.name));
    var resp = await request.send();
    final responsedata = json.decode(await resp.stream.bytesToString());
    print(responsedata);
    var countData = responsedata['count data'];
    print(countData);
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            "تم اظافة : ${countData.toString()} كرت الى الفئة:${package.toString()}  بنجاح  ",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: StyleWidget.fontName,
            ),
          ),
        ),
      ));
  }

  builddilog(BuildContext context, final Package package) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              Center(
                  child: Text(
                '${package.packagePriceId.packagePrice}: هل متاكد من اضافة هذا الملف الى باقة',
                style: const TextStyle(
                  fontFamily: StyleWidget.fontName,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              )),
              const Text(': رابط المسار ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: StyleWidget.fontName,
                      fontWeight: FontWeight.bold)),
              Text(
                (objFile != null ? objFile!.path : '')!,
                style: TextStyle(
                    fontFamily: StyleWidget.fontName,
                    color: Colors.blue.shade900),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  'اسم الملف',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: StyleWidget.fontName,
                  ),
                ),
              ),
              new Text(
                objFile!.path!.split('/').last,
                style: TextStyle(
                    fontFamily: StyleWidget.fontName,
                    color: Colors.blue.shade900),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    color: Colors.blue[100],
                    child: ts(
                      "الغاء",
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: StyleWidget.fontName,
                        letterSpacing: 0.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    color: Colors.green,
                    child: ts(
                      "موافق",
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: StyleWidget.fontName,
                        letterSpacing: 0.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      print('do');
                      uploadSelectedFile(package.packagePriceId.id,
                          package.packagePriceId.packagePrice);

                      // Navigator.of(context)
                      // .popUntil(ModalRoute.withName("/_Packages_StyleState"));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}

class Animation_Packages extends StatefulWidget {
  late final Animation<double> mainScreenAnimation;

  late final Widget child;
  late final Animation<double> animation;

  @override
  _NNNNState createState() => _NNNNState();
}

class _NNNNState extends State<Animation_Packages>
    with TickerProviderStateMixin {
  late final Animation<double> mainScreenAnimation;
  late final AnimationController animationController;
  var child;
  Future<List<Package>?> fetchPackage =
      packageApi.getAllPackagePrice(networkId.toString());
  @override
  void initState() {
    super.initState();
    networkId.toString();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    final _curvedAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController,
    );

    mainScreenAnimation =
        Tween<double>(begin: 0, end: 1).animate(_curvedAnimation);
    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      networkId.toString();
      print(networkId);
    });
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: AnimatedBuilder(
          animation: animationController,
          child: child,
          builder: (context, child) {
            return FadeTransition(
              opacity: mainScreenAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - mainScreenAnimation.value), 0.0),
                child: Container(
                  height: 216,
                  color: Colors.grey[50],
                  width: double.infinity,
                  child: StreamBuilder(
                    stream: fetchPackage.asStream(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 20,
                        );
                      } else if (snapshot.data.length == 0) {
                        return buildNoTasks(theme);
                      } else {
                        return Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final int count = snapshot.data.length > 10
                                  ? 10
                                  : snapshot.data.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController.forward();

                              return Packages_Style(
                                package: snapshot.data[index],
                                animation: animation,
                                animationController: animationController, index: index,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Center buildNoTasks(ThemeData theme) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Icon(
                  Icons.sentiment_dissatisfied,
                  size: 100,
                  color: Colors.redAccent,
                ),
                Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ts(
                        'لا يوجد باقات مضافة حاليا',
                        const TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}



// import 'dart:convert';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import '../../../../../Api/Manager/Models/Package.dart';
// import '../../../../../Api/Manager/Repositorys/Network.dart';
// import '../../../../../Api/Manager/Repositorys/Package.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import '../../../../../UI/Manager/widget/style_app/Style_widget.dart';
// import '../../../../../UI/Manager/widget/widget_public.dart';
// import 'package:http/http.dart' as http;

// class Packages_Style extends StatefulWidget {
//   final Package package;
//   final AnimationController animationController;
//   final Animation<double> animation;

//   const Packages_Style(
//       {Key? key,
//       required this.package,
//       required this.animationController,
//       required this.animation})
//       : super(key: key);
//   @override
//   _Packages_StyleState createState() =>
//       _Packages_StyleState(package, animationController, animation);
// }

// class _Packages_StyleState extends State<Packages_Style> {
//   final Package package;
//   late final AnimationController animationController;
//   late final Animation<double> animation;

//   _Packages_StyleState(this.package, this.animationController, this.animation);

//   @override
//   Widget build(BuildContext context) {
//     var heigth = MediaQuery.of(context).padding.top + 7;
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (BuildContext context, Widget? child) {
//         return FadeTransition(
//           opacity: animation,
//           child: Transform(
//             transform: Matrix4.translationValues(
//                 100 * (1.0 - animation.value), 0.0, 0.0),
//             child: Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 40, left: 20, right: 0, ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Colors.indigo.withOpacity(0.6),
//                             offset: const Offset(1.1, 4.0),
//                             blurRadius: 8.0),
//                       ],
//                       gradient: LinearGradient(
//                         colors: <Color>[
//                           HexColor('#6F72CA'),
//                           HexColor('#5C5EDD'),
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: const BorderRadius.only(
//                         bottomRight: Radius.circular(8.0),
//                         bottomLeft: Radius.circular(8.0),
//                         topLeft: Radius.circular(8.0),
//                         topRight: Radius.circular(54.0),
//                       ),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: <Widget>[
//                             builddetails(
//                               "الفئة :  ${package.packagePriceId.packagePrice}",
//                               "ريال",
//                             ),
//                             SizedBox(
//                               height: heigth,
//                             ),
//                             builddetails(
//                               'الوقت' ' : ${package.packageTime}',
//                               "${package.detailsTime}",
//                             ),
//                             SizedBox(
//                               height: heigth,
//                             ),
//                             builddetails(
//                               'البيانات' ': ${package.packageData}',
//                               "${package.detailsData}",
//                             ),
//                             SizedBox(
//                               height: heigth,
//                             ),
//                             builddetails(
//                               'الصلاحية' ' : ${package.packageValidity}',
//                               "${package.detailsValidity}",
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                     icon: Container(
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           color: Colors.deepOrange),
//                                       child: Icon(
//                                         Icons.add,
//                                         size: 25,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       chooseFileUsingFilePicker(package);
//                                     }),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 15,
//                   right: 65,
//                   child: Container(
//                     child: Center(
//                         child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: ts(
//                               "${package.packagePriceId.packagePrice}",
//                               const TextStyle(color: Colors.white),
//                             ))),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFAFAFA).withOpacity(0.2),
//                       boxShadow: <BoxShadow>[
//                         const BoxShadow(
//                             color: Colors.indigo,
//                             offset: const Offset(1.1, 4.0),
//                             blurRadius: 0.1),
//                       ],
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   builddetails(String string1, String string2) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ts(
//             string1,
//             const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 13,
//               fontFamily: StyleWidget.fontName,
//               // letterSpacing: 0.2,
//               color: Color(0xFFFFFFFF),
//             ),
//           ),
//           Text(
//             string2,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 13,
//               fontFamily: StyleWidget.fontName,
//               letterSpacing: 0.2,
//               color: Color(0xFFFFFFFF),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// /////// //////////////// This is for get File csv

//   PlatformFile? objFile;

//   void chooseFileUsingFilePicker(final Package mealsListData) async {
//     var result = await FilePicker.platform.pickFiles(
//       withReadStream: true,
//     );
//     if (result != null) {
//       setState(() {
//         objFile = result.files.single;
//         objFile != null
//             ? builddilog(context, mealsListData).toString()
//             // ignore: unnecessary_statements
//             : '...';
//       });
//     }
//   }

//   void uploadSelectedFile(String packageId, package) async {
//     final request = http.MultipartRequest(
//       "POST",
//       Uri.parse("$uri/csv/uploadfile"),
//     );

//     request.fields["id"] = "abc";
//     request.fields.addAll({
//       "PackageId": packageId,
//     });
//     request.files.add(new http.MultipartFile(
//         "uploadfile", objFile!.readStream!, objFile!.size!,
//         filename: objFile!.name));
//     var resp = await request.send();
//     final responsedata = json.decode(await resp.stream.bytesToString());
//     print(responsedata);
//     var countData = responsedata['count data'];
//     print(countData);
//     ScaffoldMessenger.of(context)
//       ..removeCurrentSnackBar()
//       ..showSnackBar(SnackBar(
//         backgroundColor: Colors.green,
//         content: Padding(
//           padding: const EdgeInsets.only(right: 8.0),
//           child: Text(
//             "تم اظافة : ${countData.toString()} كرت الى الفئة:${package.toString()}  بنجاح  ",
//             textAlign: TextAlign.justify,
//             style: TextStyle(
//               fontFamily: StyleWidget.fontName,
//             ),
//           ),
//         ),
//       ));
//   }

//   builddilog(BuildContext context, final Package package) {
//     showDialog<void>(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             actions: [
//               Center(
//                   child: Text(
//                 '${package.packagePriceId.packagePrice}: هل متاكد من اضافة هذا الملف الى باقة',
//                 style: const TextStyle(
//                   fontFamily: StyleWidget.fontName,
//                   color: Colors.deepOrange,
//                 ),
//                 textAlign: TextAlign.center,
//               )),
//               const Text(': رابط المسار ',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontFamily: StyleWidget.fontName,
//                       fontWeight: FontWeight.bold)),
//               Text(
//                 (objFile != null ? objFile!.path : '')!,
//                 style: TextStyle(
//                     fontFamily: StyleWidget.fontName,
//                     color: Colors.blue.shade900),
//                 textAlign: TextAlign.center,
//                 softWrap: true,
//               ),
//               const Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: const Text(
//                   'اسم الملف',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontFamily: StyleWidget.fontName,
//                   ),
//                 ),
//               ),
//               new Text(
//                 objFile!.path!.split('/').last,
//                 style: TextStyle(
//                     fontFamily: StyleWidget.fontName,
//                     color: Colors.blue.shade900),
//                 textAlign: TextAlign.center,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   FlatButton(
//                     color: Colors.blue[100],
//                     child: ts(
//                       "الغاء",
//                       const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                         fontFamily: StyleWidget.fontName,
//                         letterSpacing: 0.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   FlatButton(
//                     color: Colors.green,
//                     child: ts(
//                       "موافق",
//                       const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                         fontFamily: StyleWidget.fontName,
//                         letterSpacing: 0.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                     onPressed: () async {
//                       print('do');
//                       uploadSelectedFile(package.packagePriceId.id,
//                           package.packagePriceId.packagePrice);

//                       // Navigator.of(context)
//                       // .popUntil(ModalRoute.withName("/_Packages_StyleState"));
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
// }

// class Animation_Packages extends StatefulWidget {
//   late final Animation<double> mainScreenAnimation;

//   late final Widget child;
//   late final Animation<double> animation;

//   @override
//   _NNNNState createState() => _NNNNState();
// }

// class _NNNNState extends State<Animation_Packages>
//     with TickerProviderStateMixin {
//   late final Animation<double> mainScreenAnimation;
//   late final AnimationController animationController;
//   var child;
//   Future<List<Package>?> fetchPackage =
//       packageApi.getAllPackagePrice(networkId.toString());
//   @override
//   void initState() {
//     super.initState();
//     networkId.toString();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     final _curvedAnimation = CurvedAnimation(
//       curve: Curves.fastOutSlowIn,
//       parent: animationController,
//     );

//     mainScreenAnimation =
//         Tween<double>(begin: 0, end: 1).animate(_curvedAnimation);
//     animationController.forward();
//   }

//   @override
//   dispose() {
//     animationController.dispose(); // you need this
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       networkId.toString();
//       print(networkId);
//     });
//     var theme = Theme.of(context);
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Center(
//         child: AnimatedBuilder(
//           animation: animationController,
//           child: child,
//           builder: (context, child) {
//             return FadeTransition(
//               opacity: mainScreenAnimation,
//               child: Transform(
//                 transform: Matrix4.translationValues(
//                     0.0, 30 * (1.0 - mainScreenAnimation.value), 0.0),
//                 child: Container(
//                   height: 216,
//                   color: Colors.grey[50],
//                   width: double.infinity,
//                   child: StreamBuilder(
//                     stream: fetchPackage.asStream(),
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (!snapshot.hasData) {
//                         return const SpinKitThreeBounce(
//                           color: Colors.blue,
//                           size: 20,
//                         );
//                       } else if (snapshot.data.length == 0) {
//                         return buildNoTasks(theme);
//                       } else {
//                         return Container(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width,
//                           child: ListView.builder(
//                             itemCount: snapshot.data.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (BuildContext context, int index) {
//                               final int count = snapshot.data.length > 10
//                                   ? 10
//                                   : snapshot.data.length;
//                               final Animation<double> animation =
//                                   Tween<double>(begin: 0.0, end: 1.0).animate(
//                                       CurvedAnimation(
//                                           parent: animationController,
//                                           curve: Interval(
//                                               (1 / count) * index, 1.0,
//                                               curve: Curves.fastOutSlowIn)));
//                               animationController.forward();

//                               return Packages_Style(
//                                 package: snapshot.data[index],
//                                 animation: animation,
//                                 animationController: animationController,
//                               );
//                             },
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Center buildNoTasks(ThemeData theme) {
//     return Center(
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 const Icon(
//                   Icons.sentiment_dissatisfied,
//                   size: 100,
//                   color: Colors.redAccent,
//                 ),
//                 Card(
//                   color: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 10,
//                   child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ts(
//                         'لا يوجد باقات مضافة حاليا',
//                         const TextStyle(
//                           color: Colors.white,
//                         ),
//                       )),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
// }

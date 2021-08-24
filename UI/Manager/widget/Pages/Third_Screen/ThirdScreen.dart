import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../Api/Manager/Models/Package.dart';
import '../../../../../Api/Manager/Repositorys/Network.dart';
import '../../../../../Api/Manager/Repositorys/Package.dart';
import '../../../../../Api/Manager/Repositorys/User.dart';
import '../../../../../UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../../UI/Manager/widget/Drawer/networkProfile.dart';
import '../../../../../UI/Manager/widget/Updateand_Delete/updateand&delete.dart';
import '../../../../../UI/Manager/widget/functions_public/functions.dart';
import '../../../../../UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../../UI/Manager/widget/style_app/Them.dart';
import '../../../../../UI/Manager/widget/timelines.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../UI/Manager/widget/widget_public.dart';
import 'Details_bouquet.dart';
import 'package:flutter/services.dart';

class ThirdScreenState extends StatefulWidget {
  @override
  _ThirdScreenStateState createState() => _ThirdScreenStateState();
}

class _ThirdScreenStateState extends State<ThirdScreenState> {
  String? _value1;

  String? _vlaue2;

  String? _vlaue3;

  dynamic name;

  bool valdition = false;

  final _formkeypackages = GlobalKey<FormState>();

  final TextEditingController time = TextEditingController();

  final TextEditingController validity = TextEditingController();

  final TextEditingController data = TextEditingController();

  Future<Null> _refreshData() async {
    setState(() {
      packageApi.getAllPackagePrice('60a275f422e2c338bc226a42'
          // networkId.toString()

          );
    });
  }

  // void dispose() {
  //   time.dispose();
  //   validity.dispose();
  //   data.dispose();

  //   super.dispose();
  // }

  var copyData;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Future<List<PackagePriceId>?> fetchTask =
        packageApi.getPackagePrice('60a275f422e2c338bc226a42'
            // networkId.toString()

            );
    String TheNetworkIds = '';
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Theme(
              data: HotelAppTheme.buildLightTheme(),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      /////////////////////////////
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListView(
                        children: [
                          text(networkId.toString()),
                          text(userId.toString()),
                          customAppBar(
                              'تفاصيل الباقات',
                              'يجب اضافة التفاصيل لكل باقة تمت اضافتها',
                              "assets/runner.png",
                              14),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 1, bottom: 1),
                                child: StreamBuilder(
                                  stream: fetchTask.asStream(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return buildCircularProgressIndicator();
                                    } else if (snapshot.data.length == 0) {
                                      return buildNoTasks(
                                          theme, 'لا توجد بيانات');
                                    } else {
                                      return Container(
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Container(
                                            child: StreamBuilder(
                                              stream: fetchTask.asStream(),
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                if (!snapshot.hasData) {
                                                  return buildCircularProgressIndicator();
                                                } else if (snapshot
                                                        .data.length ==
                                                    0) {
                                                  return buildNoTasks(
                                                      theme, 'لا توجد بيانات');
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5,
                                                        ),
                                                        color: Colors.grey,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                          color: Colors.white,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: ListView.builder(
                                                            itemCount: snapshot
                                                                .data.length,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              copyData =
                                                                  snapshot.data[
                                                                      index];
                                                              var data =
                                                                  snapshot.data[
                                                                      index];
                                                              return Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 170,
                                                                    child: Card(
                                                                      elevation:
                                                                          5,
                                                                      shadowColor:
                                                                          Colors
                                                                              .black,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          RichText(
                                                                            text:
                                                                                TextSpan(
                                                                              text: '',
                                                                              style: DefaultTextStyle.of(context).style,
                                                                              children: <TextSpan>[
                                                                                const TextSpan(
                                                                                    text: '   فئة :',
                                                                                    style: const TextStyle(
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                                TextSpan(
                                                                                    text: '${data.packagePrice}',
                                                                                    style: const TextStyle(
                                                                                      color: Colors.deepOrangeAccent,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                                const TextSpan(
                                                                                    text: ' ريال يمني',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 12,
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 135,
                                                                    bottom: 40,
                                                                    right: 0.50,
                                                                    child: IconButton(
                                                                        icon: Container(
                                                                          color:
                                                                              Colors.blue,
                                                                          child:
                                                                              const Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                        onPressed: () async {
                                                                          await buildbottomSheet(
                                                                              data);
                                                                        }),
                                                                  ),
                                                                  Positioned(
                                                                      right:
                                                                          135,
                                                                      bottom:
                                                                          40,
                                                                      left:
                                                                          0.50,
                                                                      child: IconButton(
                                                                          icon: const Icon(
                                                                            Icons.edit,
                                                                            color:
                                                                                Colors.blue,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          onPressed: () async {
                                                                            builshowDialogPackage(
                                                                              context,
                                                                              data,
                                                                            );
                                                                          })),
                                                                  Positioned(
                                                                      right:
                                                                          130,
                                                                      top: 39,
                                                                      child:
                                                                          IconButton(
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          AwesomeDialog(
                                                                            context:
                                                                                context,
                                                                            dialogType:
                                                                                DialogType.QUESTION,
                                                                            animType:
                                                                                AnimType.RIGHSLIDE,
                                                                            headerAnimationLoop:
                                                                                false,
                                                                            title:
                                                                                " حذف : (${data.packagePrice} )",
                                                                            desc:
                                                                                '   سيتم حذف  (${data.packagePrice}) نهائياً هل انت متاكد من ذالك  ',
                                                                            btnOkOnPress:
                                                                                () async {
                                                                              PackagePriceId packagePrice = PackagePriceId(
                                                                                id: data.id,
                                                                                packagePrice: data.packagePrice,
                                                                                network: '',
                                                                                isAdd: true,
                                                                              );
                                                                              await packageApi.deletePackagePrice(packagePrice);
                                                                              setState(() {
                                                                                fetchTask = packageApi.getPackagePrice(networkId);
                                                                              });
                                                                            },
                                                                            btnOkText:
                                                                                'موافق',
                                                                            btnCancelText:
                                                                                'الغاء',
                                                                            btnCancelOnPress:
                                                                                () {},
                                                                            btnOkColor:
                                                                                Colors.red,
                                                                          )..show();
                                                                        },
                                                                      )),
                                                                ],
                                                              );
                                                            }),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                              const Divider(
                                height: 10,
                                color: Colors.black,
                                endIndent: 8,
                                indent: 8,
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  ts(
                                      'اظافة عدد الكروت الى الفئات المظافة',
                                      const TextStyle(
                                        fontFamily: StyleWidget.fontName,
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              Animation_Packages(),
                              const Divider(
                                height: 10,
                                color: Colors.black,
                                endIndent: 8,
                                indent: 8,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child: ProcessTimelinePage()),
                              ),
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: RaisedButtons(
                                  child: ts(
                                      'التالي',
                                      const TextStyle(
                                          color: Colors.white,
                                          fontFamily: StyleWidget.fontName)),
                                  color: Colors.blue,
                                  onPressed: () {
                                    validatedata() {
                                      if (copyData.isAdd == true) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DrawerWithAppBar()),
                                          (Route<dynamic> route) => false,
                                        );
                                      } else if (copyData.isAdd == false) {
                                        ScaffoldMessenger.of(context)
                                          ..removeCurrentSnackBar()
                                          ..showSnackBar(SnackBar(
                                            backgroundColor: Colors.deepOrange,
                                            padding: EdgeInsets.only(
                                              left: 0,
                                            ),
                                            content: Text(
                                              ' تاكد من اضافة الكروت الى جميع الفئات الموجودة',
                                              style: TextStyle(
                                                  fontFamily:
                                                      StyleWidget.fontName),
                                            ),
                                          ));
                                      }
                                    }

                                    validatedata();

                                    bool sizeicon = true;

                                    sizeicon
                                        ? setState(() {})
                                        :
                                        // ignore: dead_code
                                        setState(() {
                                            processIndex = (processIndex + 1) %
                                                processes.length;
                                          });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )))),
        )));
  }

  Padding buildbuttum(DropdownButtonFormField dropdownButtonFormField,
      TextFormField textFormField, String string) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: Colors.grey,
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              4,
            ),
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  // flex: 3,
                  child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: dropdownButtonFormField,
                      )),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: textFormField,
                )),
                Expanded(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ts(
                                string,
                                const TextStyle(
                                  fontFamily: StyleWidget.fontName,
                                ))))),
              ]),
        ),
      ),
    );
  }

  buildbottomSheet(PackagePriceId data1) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkeypackages,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: Colors.blue,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7),
                      topLeft: Radius.circular(7),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 300,
                  margin: const EdgeInsets.all(2),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(7),
                                topLeft: Radius.circular(7),
                              ),
                              color: Colors.blue,
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ts(
                                        'تفاصيل الباقات',
                                        const TextStyle(
                                          fontFamily: StyleWidget.fontName,
                                        )),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'اسم الفئة : ',
                                              style: const TextStyle(
                                                fontFamily:
                                                    StyleWidget.fontName,
                                                color: Colors.black,
                                              )),
                                          TextSpan(
                                              text: data1.packagePrice,
                                              style: const TextStyle(
                                                fontFamily:
                                                    StyleWidget.fontName,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _value1,
                              hint: ts(
                                  'ساعة',
                                  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              onChanged: (salutation) =>
                                  setState(() => _value1 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد الوقت' : null,
                              items: [
                                'ساعة',
                                'يوم'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              time,
                              "يجب ادخال وقت الاستخدام",
                              null,
                              TextInputType.number,
                            ),
                            'وقت الاستخدام',
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                            endIndent: 8,
                            indent: 8,
                            thickness: 1,
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _vlaue2,
                              hint: ts('يوم',
                                  TextStyle(fontWeight: FontWeight.bold)),
                              onChanged: (salutation) =>
                                  setState(() => _vlaue2 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد الصلاحية' : null,
                              items: [
                                'ساعة',
                                'يوم',
                                'شهر'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              validity,
                              "يجب ادخال الصلاحية",
                              null,
                              TextInputType.number,
                            ),
                            'الصلاحية',
                          ),
                          Divider(
                            height: 20,
                            color: Colors.black,
                            endIndent: 8,
                            indent: 8,
                            thickness: 1,
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _vlaue3,
                              hint: ts(
                                  'ميجا',
                                  TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (salutation) =>
                                  setState(() => _vlaue3 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد البيانات' : null,
                              items: [
                                'ميجا',
                                'جيجا',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              data,
                              "يجب ادخال البيانات",
                              null,
                              TextInputType.number,
                            ),
                            'البيانات',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RaisedButton(
                                elevation: 5,
                                color: Colors.blue,
                                child: ts(
                                    'التالي    ',
                                    const TextStyle(
                                        color: Colors.white,
                                        fontFamily: StyleWidget.fontName)),
                                onPressed: () {
                                  if (_formkeypackages.currentState!
                                      .validate()) {
                                    _formkeypackages.currentState!.save();
                                    packageApi.postdetailsPackage(
                                        data.text,
                                        time.text,
                                        validity.text,
                                        _value1 ?? 'ساعة',
                                        _vlaue2 ?? 'يوم',
                                        _vlaue3 ?? 'ميجا',
                                        networkId,
                                        data1.id,
                                        userId,
                                        data1,
                                        true);

                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ThirdScreenState(),
                                          ));
                                    });
                                    setState(() {
                                      // packageApi.getAllPackagePrice(
                                      //     NetworkId.toString());
                                      // WidgetsBinding.instance!
                                      //     .addPostFrameCallback((_) {
                                      //   Navigator.pushReplacement(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ThirdScreenState(),
                                      //       ));
                                      // });
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThirdScreenState()),
                                        (Route<dynamic> route) => false,
                                      );
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ThirdScreenState()));
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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
//             child: Container(
//               decoration: BoxDecoration(
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Colors.indigo.withOpacity(0.6),
//                       offset: const Offset(1.1, 4.0),
//                       blurRadius: 8.0),
//                 ],
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     HexColor('#6F72CA'),
//                     HexColor('#5C5EDD'),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: const BorderRadius.only(
//                   bottomRight: Radius.circular(8.0),
//                   bottomLeft: Radius.circular(8.0),
//                   topLeft: Radius.circular(8.0),
//                   topRight: Radius.circular(54.0),
//                 ),
//               ),
             
//                 child: Padding(
//                   padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 0),
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 40, left: 20, right: 0, bottom: 0),
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
//                       Positioned(
//                         top: 0,
//                         right: 65,
//                         child: Container(
//                           child: Center(
//                               child: Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: ts(
//                                     "${package.packagePriceId.packagePrice}",
//                                     const TextStyle(color: Colors.white),
//                                   ))),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFAFAFA).withOpacity(0.2),
//                             boxShadow: <BoxShadow>[
//                               const BoxShadow(
//                                   color: Colors.indigo,
//                                   offset: const Offset(1.1, 4.0),
//                                   blurRadius: 0.1),
//                             ],
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
           
       
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

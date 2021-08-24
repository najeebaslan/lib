import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../.././Api/Manager/Models/Caverageerea.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Caverageerea.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././UI/Manager/widget/Pages/Third_Screen/ThirdScreen.dart';
import '../../../../.././UI/Manager/widget/Updateand_Delete/updateand&delete.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import '../../../../.././UI/Manager/widget/timelines.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';
import 'show_and_hide.dart';

var test;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String idNet = "";
  String Userid = "";
  String data = "";
  bool sizeicon = true;
  bool sizeicon2 = false;
  bool sizeicon3 = true;
  bool sizeicon1 = true;
  bool sizeicon4 = false;
  bool sizeicon5 = true;

  final TextEditingController _packegprice = TextEditingController();
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  final _formkeyPlaces = GlobalKey<FormState>();

  late PackagePriceId packagePrice;
  //refresh data from server
  Future<Null> _refreshLocalGallery() async {
    setState(() {
      allEreaApi.getCaverageerea(networkId);
    });
  }

  final TextEditingController ereanetworks = TextEditingController();
  @override
  void dispose() {
    ereanetworks.dispose();
    _packegprice.dispose();
    super.dispose();
  }

  // @override
  // void initState() {

  //   NetworkId;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // NetworkId.toString();

    // Future<List<PackagePriceId>?> fetchPackage =
    //     packageApi.getPackagePrice(NetworkId.toString());
    Future<List<EreaNotidnetwork>?> fetchTask =
        allEreaApi.getCaverageerea(networkId.toString());
    var theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: RefreshIndicator(
          strokeWidth: 2,
          onRefresh: _refreshLocalGallery,
          child: Theme(
              data: HotelAppTheme.buildLightTheme(),
              child: Form(
                key: _formkeyPlaces,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView(
                      addAutomaticKeepAlives: false,
                      children: [

                        text(networkId.toString()),

                        customAppBar(
                          "مناطق تغطية الشبكة",
                          "تشمل اسماء المناطق والشوارع و الحارات ",
                           "assets/runner.png",
                           14
                        ),
                        // FadeAnimation(
                        //   0,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Expanded(
                                      child: SizedBox(
                                          child:
                                              // FadeAnimation(
                                              //     0,
                                              buildTextFormFieldcontroller(
                                        ereanetworks,
                                        "",
                                        '',
                                        " مناطق تغطية الشبكة",
                                        "يجب ادخال  مناطق تغطية الشبكة",
                                        sizeicon
                                            ? null
                                            : IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  allEreaApi.postCaverageErea(
                                                      ereanetworks.text,
                                                      networkId);
                                                  allEreaApi.getCaverageerea(
                                                      networkId);
                                                  setState(() {
                                                    allEreaApi.getCaverageerea(
                                                        networkId);
                                                  });
                                                  sizeicon2 = true;
                                                  sizeicon3 = false;
                                                  setState(() {
                                                    sizeicon = true;
                                                    sizeicon3 = false;
                                                    ereanetworks.clear();
                                                  });
                                                }),
                                        IconButton(
                                            icon: Icon(
                                                Icons.add_location_alt_rounded),
                                            onPressed: () {}),
                                        TextInputType.text,
                                      )),
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                              if (sizeicon2)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child:
                                      // FadeAnimation(
                                      //   0,
                                      StreamBuilder(
                                    stream: fetchTask.asStream(),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (!snapshot.hasData) {
                                        return buildCircularProgressIndicator();
                                      } else if (snapshot.data.length == 0) {
                                        return buildNoTasks(theme, 'لا توجد بيانات',);
                                      } else {
                                        return Card(
                                          elevation: 5,
                                          child: Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  var data =
                                                      snapshot.data[index];

                                                  return InkWell(
                                                      onTap: () {
                                                        builshowDialogErea(
                                                          context,
                                                          data,
                                                        );
                                                      },
                                                      onLongPress: () async {
                                                        AwesomeDialog(
                                                          context: context,
                                                          dialogType: DialogType
                                                              .QUESTION,
                                                          animType: AnimType
                                                              .RIGHSLIDE,
                                                          headerAnimationLoop:
                                                              false,
                                                          title:
                                                              " حذف : (${data.allcaverageErea} )",
                                                          desc:
                                                              '   سيتم حذف  (${data.allcaverageErea}) نهائياً هل انت متاكد من ذالك  ',
                                                          btnOkOnPress:
                                                              () async {
                                                            Allcaverage_erea
                                                                allcaverageerea =
                                                                Allcaverage_erea(
                                                              allcaverageErea: data
                                                                  .allcaverageErea,
                                                              id: data.id,
                                                            );
                                                            allEreaApi
                                                                .deleteAllcaverage(
                                                                    allcaverageerea);
                                                          },
                                                          btnOkText: 'موافق',
                                                          btnCancelText:
                                                              'الغاء',
                                                          btnCancelOnPress:
                                                              () {},
                                                          btnOkColor:
                                                              Colors.red,
                                                        )..show();
                                                      },
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(children: [
                                                          Card(
                                                            shadowColor:
                                                                Colors.black,
                                                            elevation: 5,
                                                            color: Color(
                                                                0xFFFCFCFC),
                                                            child: Container(
                                                              width: 100,
                                                              child: Center(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Wrap(
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .up,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              text(data.allcaverageErea),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ));
                                                }),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  // ),
                                )
                              else
                                SizedBox(),
                            ],
                          ),
                        ),
                        // ),
                         size(
                          5.0,0.0,null
                        ),
                        Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                      top: 0,
                                    ),
                                    child: ts(
                                      "سعر الفئات",
                                      const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: StyleWidget.fontName,
                                        letterSpacing: 0.0,
                                        color: Colors.black,
                                      ),
                                    )
                                    //  textAlign: TextAlign.left,
                                    )
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0,
                                        right: 4.0,
                                        top: 8.0,
                                        bottom: 8.0),
                                    child:
                                        // FadeAnimation(
                                        //   0,
                                        Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Expanded(
                                                child: SizedBox(
                                                  child:
                                                      buildTextFormFieldpackage(
                                                    _packegprice,
                                                    "",
                                                    '',
                                                    " ادخل سعر الفئة",
                                                    "يجب ادخال سعر الفئة",
                                                    sizeicon1
                                                        ? null
                                                        : IconButton(
                                                            icon: const Icon(
                                                                Icons.add),
                                                            onPressed: () {
                                                              packageApi
                                                                  .getPackagePrice(
                                                                      networkId);
                                                              packageApi
                                                                  .postPackage(
                                                                      _packegprice
                                                                          .text,
                                                                      networkId);

                                                              sizeicon4 = true;
                                                              sizeicon5 = false;

                                                              setState(() {
                                                                sizeicon1 =
                                                                    true;
                                                                sizeicon5 =
                                                                    false;
                                                                _packegprice
                                                                    .clear();
                                                                // allEreaApi.getCaverageerea(idNerwork);
                                                              });
                                                            }),
                                                    IconButton(
                                                        icon: const Icon(Icons
                                                            .monetization_on),
                                                        onPressed: () {}),
                                                    TextInputType.number,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        sizeicon4
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, bottom: 8),
                                                child:
                                                    // FadeAnimation(
                                                    //   0,
                                                    StreamBuilder(
                                                  stream:  packageApi.getPackagePrice(networkId.toString()).asStream(),

                                                      // fetchPackage.asStream(),
                                                  builder: (context,
                                                      AsyncSnapshot snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return buildCircularProgressIndicator();
                                                    } else if (snapshot
                                                            .data.length ==
                                                        0) {
                                                      return buildNoTasks(theme, 'لا توجد بيانات',);
                                                    } else {
                                                      return Card(
                                                        elevation: 5,
                                                        child: Container(
                                                          color: Colors.white,
                                                          height: 45,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child:
                                                              ListView.builder(
                                                                  itemCount:
                                                                      snapshot
                                                                          .data
                                                                          .length,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    var data =
                                                                        snapshot
                                                                            .data[index];
                                                                    test = snapshot
                                                                            .data[
                                                                        index];
                                                                    return InkWell(
                                                                      onTap:
                                                                          () {
                                                                        print(test
                                                                            .network);
                                                                        builshowDialogPackage(
                                                                            context,
                                                                            data);
                                                                      },
                                                                      onLongPress:
                                                                          () async {
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
                                                                            PackagePriceId
                                                                                packagePrice =
                                                                                PackagePriceId(
                                                                              id: data.id,
                                                                              packagePrice: data.packagePrice,
                                                                              network: '', 
                                                                              isAdd: true,
                                                                            );
                                                                            await packageApi.deletePackagePrice(packagePrice);

                                                                            setState(() {
                                                                              packageApi.getPackagePrice(networkId);
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
                                                                      child:
                                                                          Card(
                                                                        shadowColor:
                                                                            Colors.black,
                                                                        elevation:
                                                                            5,
                                                                        color: Color(
                                                                            0xFFFCFCFC),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              100,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Wrap(alignment: WrapAlignment.start, verticalDirection: VerticalDirection.up, children: [
                                                                                Center(
                                                                                  child: text(
                                                                                    data.packagePrice,
                                                                                  ),
                                                                                ),
                                                                              ]),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              )
                                            // )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),

                                  // ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                      top: 0,
                                    ),
                                    child: ts(
                                      " نوع الادخال",
                                      const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: StyleWidget.fontName,
                                        letterSpacing: 0.0,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                            Card(
                                color: Colors.grey[50],
                                shadowColor: Colors.black,
                                child: Listion()),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        // FadeAnimation(
                        //   0,
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              child: ProcessTimelinePage()),
                        ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 30),
                          child: TextButton(
                              child: RaisedButtons(
                                onPressed: () async{
                                
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => ThirdScreenState()),
                                        (Route<dynamic> route) => false,
                                  );

                                },


                                color: Colors.blue,
                                child: ts(
                                  'التالي',
                                  const TextStyle(
                                      color: Colors.white, fontFamily:StyleWidget.fontName),
                                ),
                              ),
                              onPressed: () {}),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }



  //This is TextFormField for controller writing the packages
  buildTextFormFieldpackage(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String error,
    var suffixIcon,
    IconButton icon,
    TextInputType number,
  ) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        keyboardType: number,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            suffix: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ts(
                  'ريال يمني',
                  const TextStyle(
                    fontSize: 12,
                    fontFamily:StyleWidget.fontName,
                    //color: Colors.blue
                  ),
                )),
            contentPadding: EdgeInsets.all(10.0),
            hintText: hintText,
            prefixText: prefixText,
            errorStyle: const TextStyle(color: Colors.red),
            prefixStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
            prefixIcon: icon,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: const Color(0xFF727072),
              height: 1,
              fontSize: 17,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            filled: true,
            fillColor: Colors.white70),
        onChanged: (String value) {
          if (_packegprice.text.length < 11 &&
              _packegprice.text.startsWith(new RegExp("^[0-9]"))) {
            setState(() {
              sizeicon1 = false;
            });
          } else if (_packegprice.text.length < 1 &&
              _packegprice.text.isEmpty) {
            setState(() {
              sizeicon1 = true;
              sizeicon4 = false;
            });
          } else {
            sizeicon1 = true;
            sizeicon5 = true;
          }
        },
        expands: false,
        onSaved: (value) => value = value,
        validator: (name) {
          if (name!.isEmpty) {
            return (error);
          }
          return null;
        },
      ),
    );
  }

  //This is TextFormField for controller writing the Province
  buildTextFormFieldcontroller(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String error,
    var suffixIcon,
    IconButton icon,
    TextInputType number,
  ) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        keyboardType: number,
        textDirection: TextDirection.rtl,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(10.0),
            hintText: hintText,
            prefixText: prefixText,
            errorStyle: const TextStyle(color: Colors.red),
            prefixStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
            prefixIcon: icon,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color(0xFF727072),
              height: 1,
              fontSize: 17,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            filled: true,
            fillColor: Colors.white70),
        onChanged: (String value) {
          if (ereanetworks.text.length < 11 &&
              ereanetworks.text.startsWith(new RegExp("^[ا-ي]"))) {
            setState(() {
              sizeicon = false;
            });
          } else if (ereanetworks.text.length < 1 &&
              ereanetworks.text.isEmpty) {
            setState(() {
              sizeicon = true;
              sizeicon2 = false;
            });
          } else {
            sizeicon = true;
            sizeicon3 = true;
          }
        },
        expands: false,
        onSaved: (value) => value = value,
        validator: (name) {
          if (name!.isEmpty) {
            return (error);
          }
          return null;
        },
      ),
    );
  }
}

Widget customAppBar(String local, String des,image,double fontSize) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
    child: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              top: 16,
                            ),
                            child: ts(
                                local,
                                 TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: fontSize,
                                  fontFamily: StyleWidget.fontName,
                                  letterSpacing: 0.0,
                                  color: Colors.black,
                                )))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          bottom: 12,
                          top: 4,
                          right: 16,
                        ),
                        child: ts(
                          des,
                          TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            letterSpacing: 0.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -16,
          left: 0,
          child: SizedBox(
              width: 110,
              height: 110,
              child:
                  // FadeAnimation(
                  //     0,
                  Image.asset(
                image,
                fit: BoxFit.cover,
              )),
        ),
        // ),
      ],
    ),
  );
}

Center buildNoTasks(ThemeData theme,String text) {
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
                    padding: const EdgeInsets.all(5.0),
                    child: ts(text,
                      
                      const TextStyle(
                        color: Colors.white,
                        fontFamily: StyleWidget.fontName,
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

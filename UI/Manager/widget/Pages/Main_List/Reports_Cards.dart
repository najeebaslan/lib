import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import 'package:provider/provider.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';

import 'Selected_DataTime.dart';

class ReportsCards extends StatefulWidget {
  @override
  _ReportsCardsState createState() => _ReportsCardsState();
}

class _ReportsCardsState extends State<ReportsCards> {
  var selectedCurrency, selectedType;
  String pricecards = '';
  bool validatselectedCurrency = false;
  List<String> textString = [
    'مورد',
    'شخصي',
    'عميل',
    'عميل',
    'شخصي',
    'مورد',
    'عميل',
    'شخصي',
    'مورد',
    'عميل',
    'شخصي',
    'مورد',
    'عميل',
  ];
  List<int> sildecarda = [
    1,
    2,
    3,
    4,
    5,
    5,
    6,
    6,
    7,
    76,
    5,
    56,
    7,
  ];
  Future<List<PackagePriceId>?> fetchData =
      packageApi.getPackagePrice(networkId);

  @override
  Widget build(BuildContext context) {
    setState(() {});
    networkId.toString(); //This is network id
    var theme = Theme.of(context);
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: appStyleMode.Blueandgrey,
              centerTitle: true,
              title: ts(
                'فلتر التقارير ',
                TextStyle(color: appStyleMode.White, fontFamily:StyleWidget.fontName),
              )),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Theme(
                  data: HotelAppTheme.buildLightTheme(),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Row(
                        children: [
                          StreamBuilder(
                              stream: fetchData.asStream(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: buildCircularProgressIndicator(),
                                  );
                                } else if (snapshot.data.length == 0) {
                                  return buildNoTasks(
                                    theme,
                                    'لا توجد بيانات',
                                  );
                                } else {
                                  List<DropdownMenuItem<String>> currencyItems = [];
                                  for (int i = 0;
                                      i < snapshot.data.length;
                                      i++) {
                                    var snap = snapshot.data[i];

                                    currencyItems.add(
                                      DropdownMenuItem<String>(
                                        child: ts(
                                          '  ${snap.packagePrice} ريال',
                                          const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF09140A)),
                                        ),
                                        value: "${snap.packagePrice}",
                                      ),
                                    );
                                  }
                                  return Container(
                                    margin: EdgeInsets.only(left: 0, right: 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        0,
                                      ),
                                      color: Colors.grey,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          2,
                                        ),
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                      margin: EdgeInsets.all(1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: DropdownButton<String>(
                                              dropdownColor: Colors.white,
                                              items: currencyItems,
                                              onChanged: (currencyValue) {
                                                pricecards =
                                                    ' ${currencyValue.toString()}';

                                                setState(() {
                                                  selectedCurrency =
                                                      currencyValue;
                                                  if (selectedCurrency !=
                                                      null) {
                                                    buildShowBottomSheet(
                                                        context);

                                                    validatselectedCurrency =
                                                        true;
                                                  }
                                                });
                                              },
                                              value: selectedCurrency,
                                              isExpanded: false,
                                              hint: ts(
                                                "     اسم الفئة      ",
                                                TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                      0xFF0F130F,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ts(
                              'حدد التاريخ :',
                              TextStyle(
                                  color: Colors.grey.shade900,
                                  fontFamily: StyleWidget.fontName)),
                        ],
                      ),
                      DataFilter(),
                      Divider(
                        height: 15,
                        color: Color(0xFF7C7C7C),
                        thickness: 0.70,
                      ),
                      validatselectedCurrency
                          ? Column(
                              children: List<Widget>.generate(
                                sildecarda.length,
                                (index) {
                                  var knowCcount = textString[index];
                                  return AnimationConfiguration.staggeredList(
                                    delay: const Duration(milliseconds: 200),
                                    position: index,
                                    duration: const Duration(milliseconds: 600),
                                    child: SlideAnimation(
                                      horizontalOffset: 150,
                                      child: FadeInAnimation(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Card(
                                              elevation: 5,
                                              shadowColor:
                                                  appStyleMode.Blackandwhite,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight: const Radius
                                                            .circular(4),
                                                        topLeft: const Radius
                                                            .circular(4),
                                                      ),
                                                      color: Colors.blue,
                                                      // appStyleMode.Blue
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                '  رقم  الفاتورة: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                //  appStyleMode
                                                                //     .Blackandwhite,
                                                                fontFamily:
                                                                  StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '979347',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'رقم الكرت: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                //  appStyleMode
                                                                //     .Blackandwhite,
                                                                fontFamily:
                                                                   StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '934097625  ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text: ' الفئة: ',
                                                            style: TextStyle(
                                                                color: appStyleMode
                                                                    .Blackandwhite,
                                                                fontFamily:
                                                                    StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '$selectedCurrency',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                ' رقم حساب المشتري: ',
                                                            style: TextStyle(
                                                                color: appStyleMode
                                                                    .Blackandwhite,
                                                                fontFamily:
                                                                   StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '345567675',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                ' نوع الحساب: ',
                                                            style: TextStyle(
                                                                color: appStyleMode
                                                                    .Blackandwhite,
                                                                fontFamily:
                                                                    StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      '$knowCcount',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                'تاريخ البيع: ',
                                                            style: TextStyle(
                                                                color: appStyleMode
                                                                    .Blackandwhite,
                                                                fontFamily:
                                                                   StyleWidget.fontName),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: 'م'
                                                                      '2021/2/11/3',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              color: appStyleMode.Whitandgrey),
                                          Divider(
                                            height: 6,
                                            color: Color(0xFFADADAD),
                                            thickness: 0.70,
                                            endIndent: 8,
                                            indent: 8,
                                          ),
                                        ],
                                      )),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                    ]),
                  )))),
    );
  }

  buildShowBottomSheet(BuildContext context) {
    return showBottomSheet<Null>(
      context: context,
      builder: (context) => Container(
        color: Colors.blue[50],
        margin: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
        height: 100,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1, color: Colors.black, spreadRadius: 1)
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(Icons.close_outlined),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                }),
                            ts(
                              'اجمالي التقارير',
                              const TextStyle(fontFamily: StyleWidget.fontName),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ts(
                          'الفئة',
                          const TextStyle(
                              color: Colors.deepOrange, fontFamily: StyleWidget.fontName),
                        ),
                        ts(
                          'عدد الكروت',
                          const TextStyle(
                              color: Colors.deepOrange, fontFamily: StyleWidget.fontName),
                        ),
                        ts(
                          'المبلغ',
                          TextStyle(
                              color: Colors.deepOrange, fontFamily: StyleWidget.fontName),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ts(
                          '$selectedCurrency',
                          const TextStyle(
                              color: Colors.blue, fontFamily: StyleWidget.fontName),
                        ),
                        ts(
                          '65',
                          const TextStyle(
                              color: Colors.blue, fontFamily: StyleWidget.fontName),
                        ),
                        ts(
                          '3900 ريال',
                          const TextStyle(
                              color: Colors.blue, fontFamily: StyleWidget.fontName),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

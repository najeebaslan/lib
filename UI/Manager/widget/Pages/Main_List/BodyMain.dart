import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././UI/Client/Pages/Main/mainClient.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/Pages/Third_Screen/Details_bouquet.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';

import 'dart:math' as math;

import '../../../../.././UI/Manager/widget/widget_public.dart';

class BodyMain extends StatefulWidget {
  @override
  _BodeMain createState() => _BodeMain();
}

class _BodeMain extends State<BodyMain> {
  @override
  Widget build(BuildContext context) {
    Package imageSliders;
    networkId.toString();
    Future<List<Package>?> fetchTask3 =
        packageApi.getAllPackagePrice(networkId);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 0),
        child: Container(
          decoration: BoxDecoration(
            color: StyleWidget.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(2.0),
                bottomLeft: const Radius.circular(2.0),
                bottomRight: const Radius.circular(2.0),
                topRight: const Radius.circular(4.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: StyleWidget.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: StreamBuilder(
            stream: fetchTask3.asStream(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return buildCircularProgressIndicator();
              } else if (snapshot.data.length == 0) {
                var theme = Theme.of(context);
                return buildNoTasks(
                  theme,
                  'لا توجد بيانات',
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data[index];
                    imageSliders = data;
                    print(imageSliders.packageData.length);
                    return Card(
                      shadowColor: Colors.black,
                      elevation: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Wrap(
                              // direction: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 0),
                                              child: Text(
                                                ' اسم الفئة: ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      StyleWidget.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: -0.1,
                                                  color: StyleWidget.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text(
                                                '${(data.packagePriceId.packagePrice)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      StyleWidget.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: StyleWidget.darkerText,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 20,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: HexColor('#87A0E5')
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0)),
                                              ),
                                            ),
                                            columnData(
                                              ((data.packageData.length)),
                                              'المتوفر:  ',
                                              'كرت',
                                            )
                                            // Column(
                                            //   children: <Widget>[
                                            //     Padding(
                                            //       padding:
                                            //           const EdgeInsets.only(
                                            //               left: 8.0),
                                            //       child: Row(
                                            //         children: <Widget>[
                                            //           Text(
                                            //             'المتوفر:  ',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontFamily:
                                            //                   StyleWidget
                                            //                       .fontName,
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 16,
                                            //               letterSpacing: -0.1,
                                            //               color: StyleWidget
                                            //                   .grey
                                            //                   .withOpacity(0.5),
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             '${} ',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontFamily:
                                            //                   StyleWidget
                                            //                       .fontName,
                                            //               fontWeight:
                                            //                   FontWeight.w600,
                                            //               fontSize: 14,
                                            //               color: StyleWidget
                                            //                   .darkerText,
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             'كرت',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontFamily:
                                            //                   StyleWidget
                                            //                       .fontName,
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 14,
                                            //               letterSpacing: -0.1,
                                            //               color: StyleWidget
                                            //                   .grey
                                            //                   .withOpacity(0.5),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 20,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F56E98')
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.all(
                                                    const Radius.circular(4.0)),
                                              ),
                                            ),
                                            columnData(
                                              ((snapshot.data.length).toInt()),
                                              'المباع:  ',
                                              'كرت',
                                            ),
                                            // Column(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: <Widget>[
                                            //     Padding(
                                            //       padding:
                                            //           const EdgeInsets.only(
                                            //               left: 0.0),
                                            //       child: Row(
                                            //         children: <Widget>[
                                            //           Text(
                                            //             'المباع:  ',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontFamily:
                                            //                   StyleWidget
                                            //                       .fontName,
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 16,
                                            //               letterSpacing: -0.1,
                                            //               color: StyleWidget
                                            //                   .grey
                                            //                   .withOpacity(0.5),
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             '${((snapshot.data.length).toInt())} ',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w600,
                                            //               fontSize: 14,
                                            //               color: StyleWidget
                                            //                   .darkerText,
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             'كرت',
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: TextStyle(
                                            //               fontFamily:
                                            //                   StyleWidget
                                            //                       .fontName,
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 14,
                                            //               letterSpacing: -0.1,
                                            //               color: StyleWidget
                                            //                   .grey
                                            //                   .withOpacity(0.5),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      width: 100,
                                    ),
                                    //This Circal Animation
                                    Center(
                                      child: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4,
                                                right: 5,
                                                top: 4,
                                                left: 0),
                                            child: Container(
                                              width: 85,
                                              height: 85,
                                              decoration: BoxDecoration(
                                                color: StyleWidget.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0),
                                                ),
                                                border: new Border.all(
                                                    width: 4,
                                                    color: StyleWidget
                                                        .nearlyDarkBlue
                                                        .withOpacity(0.2)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    //fetchTask.length
                                                    ' ${((snapshot.data.length).toInt())}%',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          StyleWidget.fontName,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 20,
                                                      letterSpacing: 0.0,
                                                      color: StyleWidget
                                                          .nearlyDarkBlue,
                                                    ),
                                                  ),
                                                  Text(
                                                    'الحجم الكلي ',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9,
                                                      letterSpacing: 0.0,
                                                      color: StyleWidget.grey
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 1,
                                            ),
                                            child: CustomPaint(
                                              painter: CurvePainter(
                                                  colors: [
                                                    StyleWidget.nearlyDarkBlue,
                                                    HexColor("#8A98E8"),
                                                    HexColor("#8A98E8")
                                                  ],
                                                  angle: 1 +
                                                      (360 - 360) -
                                                      (1.0 -
                                                          (((snapshot
                                                              .data.length))))),
                                              child: SizedBox(
                                                width: 90,
                                                height: 90,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 290,
                              height: 2.100,
                              color: StyleWidget.background,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          ' يوم',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 11,
                                            letterSpacing: -0.2,
                                            color: StyleWidget.darkText,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Container(
                                            height: 4,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: HexColor('#87A0E5')
                                                  .withOpacity(0.2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                            child: Wrap(
                                              children: <Widget>[
                                                Container(
                                                  width:
                                                      (data.packageData.length -
                                                          0.0),
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      HexColor('#87A0E5'),
                                                      HexColor('#87A0E5')
                                                          .withOpacity(0.5),
                                                    ]),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Text(
                                            '${((snapshot.data.length).toInt())} كرت',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11,
                                              color: StyleWidget.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 19, right: 19),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              ' اسبوع',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 11,
                                                letterSpacing: -0.2,
                                                color: StyleWidget.darkText,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Container(
                                                height: 4,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#F56E98')
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                                child: Wrap(
                                                  children: <Widget>[
                                                    Container(
                                                      width: ((snapshot
                                                              .data.length) -
                                                          0.0),
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              HexColor(
                                                                      '#F56E98')
                                                                  .withOpacity(
                                                                      0.7),
                                                              HexColor(
                                                                  '#F56E98'),
                                                            ]),
                                                        borderRadius: BorderRadius
                                                            .all(const Radius
                                                                .circular(4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Text(
                                                '${((snapshot.data.length).toInt())} كرت',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11,
                                                  color: StyleWidget.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ts(
                                              ' شهر',
                                              const TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 11,
                                                letterSpacing: -0.2,
                                                color: StyleWidget.darkText,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0, top: 4),
                                              child: Container(
                                                height: 4,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#F1B440')
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                                child: Wrap(
                                                  children: <Widget>[
                                                    Container(
                                                      width: (((snapshot
                                                              .data.length) -
                                                          0.0)),
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              HexColor(
                                                                      '#F1B440')
                                                                  .withOpacity(
                                                                      0.7),
                                                              HexColor(
                                                                  '#F1B440'),
                                                            ]),
                                                        borderRadius: BorderRadius
                                                            .all(const Radius
                                                                .circular(4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Text(
                                                '${((snapshot.data.length).toInt())} كرت',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11,
                                                  color: StyleWidget.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

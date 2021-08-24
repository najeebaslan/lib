import 'package:flutter/material.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import 'package:provider/provider.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Scaffold(
        body: Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: ListView(children: [
        customAppBar(
          "العروض",
          "العروض",
          "assets/home_images/offers.png",
          14
        ),
        Card(
            elevation: 5,
            shadowColor: appStyleMode.Blackandwhite,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(4),
                      topLeft: const Radius.circular(4),
                    ),
                    color: Colors.blue,
                    // appStyleMode.Blue
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '  مناسبة العرض: ',
                          style: TextStyle(
                              color: Colors.white, fontFamily: StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: '979347',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'رقم الكرت: ',
                          style: TextStyle(
                              color: Colors.white,
                              //  appStyleMode
                              //     .Blackandwhite,
                              fontFamily: StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: '934097625  ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: ' الفئة: ',
                          style: TextStyle(
                              color: appStyleMode.Blackandwhite,
                              fontFamily: StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'fsdfsd',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: ' رقم حساب المشتري: ',
                          style: TextStyle(
                              color: appStyleMode.Blackandwhite,
                              fontFamily: StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: '345567675',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: ' نوع الحساب: ',
                          style: TextStyle(
                              color: appStyleMode.Blackandwhite,
                              fontFamily:StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'fddgfdfg',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'تاريخ البيع: ',
                          style: TextStyle(
                              color: appStyleMode.Blackandwhite,
                              fontFamily: StyleWidget.fontName),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'م'
                                    '2021/2/11/3',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: appStyleMode.Whitandgrey),
      ]),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../.././Api/Manager/Models/Package.dart';
import '../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../.././UI/Manager/widget/style_app/Them.dart';
import '../../../.././UI/Manager/widget/widget_public.dart';

import 'mainClient.dart';

class BodyMain extends StatelessWidget {
  final Ball ball;

  const BodyMain({Key? key, required this.ball}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Package>?> fetchData = packageApi.getAllPackagePrice(
        // '6098475196404e12e88a5ad9'

        networkId);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Theme(
        data: HotelAppTheme.buildLightTheme(),
        child: Scaffold(
          body: Theme(
            data: HotelAppTheme.buildLightTheme(),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Card(
                    color:
                        //ball.color,
                        StyleWidget.background,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BackButton(),
                        const SizedBox(
                          width: 6,
                        ),
                        Hero(
                          tag: 'hero_text_${ball.name}',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              ball.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Hero(
                          tag: 'hero_ball_${ball.name}',
                          child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width / 12.2,
                              backgroundImage: AssetImage('${ball.image}')),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ball.color,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(2.0),
                          bottomLeft: const Radius.circular(2.0),
                          bottomRight: const Radius.circular(2.0),
                          topRight: const Radius.circular(2.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: StyleWidget.grey.withOpacity(0.2),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Column(
                      children: [
                        ts(
                            'تفاصيل موقع الشبكة',
                            TextStyle(
                                fontSize: 22,
                                color: StyleWidget.white,
                                fontFamily: StyleWidget.fontName)),
                        buildTowWidget(
                          'محافطة :الحديده ',
                          ' مديرية: برع ',
                        ),
                        buildTowWidget(
                          'الدعم الفني :773228315',
                          'مدينة :باجل',
                        ),
                      ],
                    ),
                  ),
                ),
                // buildDivider(),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        buildDivider(),
                        buildpadding(
                          EdgeInsets.only(left: 5, right: 5),
                          ts(
                              'الباقات الخاصه بالشبكة',
                              TextStyle(
                                  color: StyleWidget.darkText,
                                  fontFamily: StyleWidget.fontName)),
                        ),
                        buildDivider(),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder(
                      future: fetchData,
                      builder: (context, AsyncSnapshot snapshot) {
                        print(MediaQuery.of(context).size.width.toString());
                        if (!snapshot.hasData) {
                          return buildCircularProgressIndicator();
                        } else if (snapshot.data.length == 0) {
                          var theme = Theme.of(context);
                          return buildNoTasks(
                            theme,
                            'لا توجد بيانات',
                          );
                        } else {
                          var size = MediaQuery.of(context).size;

                          final double itemHeight =
                              (size.height - kToolbarHeight - 330) / 2;
                          final double itemWidth = size.width / 2;
                          return AnimationLimiter(
                              child: GridView.count(
                            addSemanticIndexes: true,
                            // childAspectRatio: (itemWidth / itemHeight),

                            childAspectRatio: 1.30,
                            primary: false,
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                              // bottom: 20,
                            ),
                            crossAxisSpacing: 1,
                            shrinkWrap: true,
                            mainAxisSpacing: 8,
                            crossAxisCount: 2,

                            children:
                                List.generate(snapshot.data.length, (index) {
                              var data = snapshot.data[index];
                              print(data.packageData.toString());
                              return AnimationConfiguration.staggeredList(
                                // delay: Duration(milliseconds: 200),
                                position: index,
                                duration: const Duration(milliseconds: 600),
                                child: SlideAnimation(
                                  verticalOffset: 150,
                                  child: FadeInAnimation(
                                    child: Card(
                                      elevation: 5,
                                      shadowColor: Colors.blue,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Container(
                                              color: ball.color,
                                              //Colors.blue[100],
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                textDirection:
                                                    TextDirection.rtl,
                                                children: [
                                                  ts(
                                                      'فئة : ${data.packagePriceId.packagePrice.toString()} ريال',
                                                      TextStyle(
                                                          color:
                                                              StyleWidget.white,
                                                          fontFamily:
                                                              StyleWidget
                                                                  .fontName,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Icon(
                                                    (Icons.shopping_basket),
                                                    color: StyleWidget.blue,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Color(0xFF201F1F),
                                              // color: Color(0xFFD9D9D9),
                                              height: 2,
                                            ),
                                            buildRow(
                                                data.packageTime.toString(),
                                                data.detailsTime.toString(),
                                                'الوقت',
                                                StyleWidget.darkText,
                                                MainAxisAlignment.spaceAround),
                                            buildRow(
                                                data.packageData.toString(),
                                                data.detailsData.toString(),
                                                'البيانات',
                                                StyleWidget.darkText,
                                                MainAxisAlignment.spaceAround),
                                            buildRow(
                                                data.packageValidity.toString(),
                                                data.detailsValidity.toString(),
                                                'الصلاحية',
                                                StyleWidget.darkText,
                                                MainAxisAlignment.spaceAround),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ));
                        }
                      }),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  buildTowWidget(
    String string1,
    String string2,
  ) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              string1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: StyleWidget.fontName,
                // fontSize: fontSize,
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              string2,
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w500,
                // fontSize: fontSize,
                letterSpacing: 0.2,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row buildRow(data, data2, String text, Color color,
    MainAxisAlignment mainAxisAlignment) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    textDirection: TextDirection.rtl,
    children: [
      ts(
        '$text : ${data}',
        TextStyle(
            color: color,
            fontFamily: StyleWidget.fontName,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 18,
      ),
      ts(
          ' ${data2}',
          TextStyle(
              color: color,
              fontFamily: StyleWidget.fontName,
              fontWeight: FontWeight.bold)),
    ],
  );
}

buildpadding(EdgeInsets edgeInsets, Widget child) => Padding(
      padding: edgeInsets,
      child: child,
    );

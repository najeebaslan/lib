import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../.././Api/Manager/Repositorys/Cards.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';

class CardsSold extends StatefulWidget {
  @override
  _CardsSoldState createState() => _CardsSoldState();
}

class _CardsSoldState extends State<CardsSold> {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    Future<dynamic>? fetchTask = Cardsapi.getCards();
    var theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: appStyleMode.Whitandgrey,
        appBar: AppBar(
          backgroundColor: appStyleMode.Blueandgrey,
          title: ts(
            'تقارير الكروت المباعة',
            TextStyle(color: appStyleMode.White),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: fetchTask,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return buildCircularProgressIndicator();
                  } else if (snapshot.data.length == 0) {
                    return buildNoTasks(theme, 'لا توجد بيانات');
                  } else {
                    return Scrollbar(
                      isAlwaysShown: true,
                      showTrackOnHover: true,radius:Radius.circular(12) ,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data[index];

                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                    elevation: 5,
                                    shadowColor: appStyleMode.Blackandwhite,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight:
                                                    const Radius.circular(4),
                                                topLeft:
                                                    const Radius.circular(4),
                                              ),
                                              color: appStyleMode.Blue),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: '  رقم حساب المشتري: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: '9797979347',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'العمولة: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: '50ريال  ',
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
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'رقم الكرت: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: data.username
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: ' مبلغ الفائة: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: '250',
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
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'تاريخ البيع: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
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
                                              RichText(
                                                text: TextSpan(
                                                  text: 'رقم الفاتورة: ',
                                                  style: TextStyle(
                                                      color: appStyleMode
                                                          .Blackandwhite,
                                                      fontFamily: StyleWidget.fontName),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: '22443',
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
                            ));
                          }),
                    );
                  }
                })),
      ),
    );
  }
}

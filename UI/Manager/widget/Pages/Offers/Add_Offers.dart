import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';

import 'credit_cards_concept/credit_card.dart';
import 'credit_cards_concept/credit_cards_concept_page.dart';

class AddOffers extends StatefulWidget {
  final CreditCard card;
  final int indexs;
  final Package package;
  const AddOffers(
      {Key? key,
      required this.card,
      required this.indexs,
      required this.package})
      : super(key: key);
  @override
  _AddOffersState createState() => _AddOffersState(package);
}

class _AddOffersState extends State<AddOffers> {
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
  final Package package;

  _AddOffersState(this.package);
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).padding.top + 7;
    var validate;
    validatedata() {
      if (widget.package.isActive == true) {
        validate = 'نشطه';
      } else if (widget.package.isActive == false) {
        validate = 'معطله';
      }
    }

    validatedata();
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 10, right: 10, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.card.color,
                        Color(0xFF6B6967),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(54.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 2, right: 2, bottom: 0),
                    child: Column(
                      children: <Widget>[
                        builddetails(
                          " حالة الفئة:",
                          "${validate.toString()}",
                          20.1,
                        ),
                        SizedBox(
                          height: heigth,
                        ),
                        builddetails(
                          '' '',
                          "اضف تفاصيل",
                          20.0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            builddetails(
                              '' 'العرض',
                              "",
                              20.0,
                            ),
                            size(0.0, 18.0, null),
                            Icon(
                              Icons.add_shopping_cart_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heigth,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 75,
                child: Container(
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.package.packagePriceId.packagePrice
                                .toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.1),
                          ))),
                  decoration: BoxDecoration(
                    color: widget.card.color,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFFB8ACAC),
                          offset: const Offset(0.1, 1.0),
                          blurRadius: 0.1),
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StyleAddOffers extends StatefulWidget {
  @override
  _StyleAddOffersState createState() => _StyleAddOffersState();
}

class _StyleAddOffersState extends State<StyleAddOffers> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Future<List<Package>?> fetchOffers =
        packageApi.getAllPackagePrice(networkId.toString()
            //  networkId.toString()

            );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            customAppBar("العروض", "", "assets/home_images/offers.png", 17),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  ts(
                      ' من هنا الانتقال الا العروض المضافة  مسبقاٌ :',
                      TextStyle(
                          color: StyleWidget.nearlyDarkBlue,
                          fontFamily:  StyleWidget.fontName)),
                ],
              ),
            ),
            Row(
              children: [
                RaisedButtons(
                    child: ts(
                        'العروض المضافة',
                        TextStyle(
                            color: StyleWidget.white, fontFamily:  StyleWidget.fontName)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (__) => CreditCardConceptPage()));
                    },
                    color: StyleWidget.blue),
              ],
            ),
            Divider(
              height: 40,
              color: Colors.black,
              endIndent: 8,
              indent: 8,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: ts(
                  'اكسب المزيد من العملاء لشبكتك عبر اضافة الكثير من العروض والتخفيضات ...',
                  TextStyle(
                      color: StyleWidget.nearlyDarkBlue, fontFamily: StyleWidget.fontName)),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: FutureBuilder(
                  future: fetchOffers,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return buildCircularProgressIndicator();
                    } else if (snapshot.data.length == 0) {
                      return buildNoTasks(theme, 'لا توجد بيانات');
                    } else {
                      return ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          // creditCards.length,
                          itemBuilder: (BuildContext context, index) {
                            var data = snapshot.data[index];

                            return InkWell(
                              onTap: () {
                                WidgetsBinding.instance!
                                    .addPostFrameCallback((_) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddDataOffers(
                                          package: data,
                                        ),
                                      ));
                                });
                              },
                              child: Align(
                                child: Transform.translate(
                                  offset: Offset(-30.0, 0.0),
                                  child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [

                                            // Text(data.packagePrice.toString())
                                            AddOffers(
                                                indexs: index,
                                                card: creditCards[index],
                                                package: data),

                                            // Expanded(
                                            //   child: buildOffer(
                                            //       context,
                                            //       _formkeypackages,
                                            //       _value1,
                                            //       _value2,
                                            //       _value3,
                                            //       _value4,
                                            //       setState(() {}),
                                            //       time,
                                            //       validity,
                                            //       data,
                                            //       offer,
                                            //       limiteUptime),
                                            // ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDataOffers extends StatefulWidget {
  final Package package;

  const AddDataOffers({Key? key, required this.package}) : super(key: key);
  @override
  _AddDataOffersState createState() => _AddDataOffersState();
}

class _AddDataOffersState extends State<AddDataOffers> {


  dynamic _value1;

  dynamic _value2;

  dynamic _value3;

  dynamic _value4;

  dynamic name;

  bool valdition = false;

  final _formkeypackages = GlobalKey<FormState>();

  final TextEditingController time = TextEditingController();

  final TextEditingController limiteUptime = TextEditingController();

  final TextEditingController validity = TextEditingController();

  final TextEditingController offer = TextEditingController();

  final TextEditingController data = TextEditingController();
  void dispose() {
    time.dispose();
    limiteUptime.dispose();
    validity.dispose();
    offer.dispose();
    data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            sizedBox(10.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ts(
                        'اضافة بيانات العرض الى الفئة: ',
                        TextStyle(
                            color: StyleWidget.nearlyDarkBlue,
                            fontFamily: StyleWidget.display1.fontFamily)),
                  ),
                  ts(widget.package.packagePriceId.packagePrice.toString(),
                      TextStyle(color: Colors.deepOrange)),
                ],
              ),
            ),
            sizedBox(10.0),
            Expanded(
              child: buildOffer(
                  context, _formkeypackages, _value1, _value2, _value3, _value4,
                  setState(() {

              }), time, validity, data, offer, limiteUptime, 16.1,
                  widget.package, networkId),
            ),
          ],
        ));
  }
}

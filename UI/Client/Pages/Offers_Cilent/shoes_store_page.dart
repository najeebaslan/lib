import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;
import '../../../.././Api/Manager/Models/Package.dart';
import '../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../.././Api/Manager/Repositorys/offers.dart';
import '../../../.././UI/Client/Pages/Main/bodyMain.dart';
import '../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../.././UI/Manager/widget/widget_public.dart';

import 'shoes_store_detail_page.dart';

const bottomBackgroundColor = Color(0xFFF1F2F7);
const brands = ['Nike', 'Adidas', 'Jordan', 'Puma', 'Reebok'];
const marginSide = 14.0;
const leftItemSeparator = const SizedBox(
  width: 30,
);

class Shoe {
  final String name;
  final String image;
  final double price;
  final Color? color;

  const Shoe({
    required this.name,
    required this.image,
    required this.price,
    this.color,
  });
}

const shoes = [
  const Shoe(
      name: 'NIKE EPICT-REACT',
      price: 130.00,
      image: 'assets/runner.png',
      color: Color(0xFF5574b9)),
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 130.00,
      image: 'assets/runner.png',
      color: Color(0xFF52b8c3)),
  const Shoe(
      name: 'NIKE AIR-270',
      price: 150.00,
      image: 'assets/runner.png',
      color: Color(0xFFE3AD9B)),
  const Shoe(
      name: 'NIKE EPICT-REACTII',
      price: 160.00,
      image: 'assets/runner.png',
      color: Color(0xFF444547)),
];

const shoesBottom = [
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 170.00,
      image: 'assets/runner.png',
      color: null),
  const Shoe(
      name: 'NIKE AIR FORCE',
      price: 130.00,
      image: 'assets/runner.png',
      color: null),
];

class ShoesStorePage extends StatefulWidget {
  @override
  _ShoesStorePageState createState() => _ShoesStorePageState();
}

class _ShoesStorePageState extends State<ShoesStorePage> {
  final _pageController = PageController(viewportFraction: 0.78);
  final _pageNotifier = ValueNotifier(0.0);

  Widget _buildBottom(BuildContext context) {
    Widget _buildBottomItem(Shoe shoe) => Directionality(
          textDirection: TextDirection.ltr,
          child: Card(
            elevation: 4,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: buildpadding(
                            const EdgeInsets.only(top: 5.0, right: 8),
                            Icon(Icons.favorite_border),
                          )),
                      Expanded(
                        child: Transform.rotate(
                            angle: vector.radians(18),
                            child: Image.asset(shoe.image)),
                      ),
                      Text(
                        shoe.name,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "\$${shoe.price}",
                        style: TextStyle(fontSize: 11),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    child: buildpadding(
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                      Text(
                        'NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        );

    return Container(
      color: bottomBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.29,
      child: buildpadding(
        const EdgeInsets.symmetric(horizontal: marginSide),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildBottomItem(shoesBottom.first),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: _buildBottomItem(shoesBottom.last),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listener() {
    _pageNotifier.value = _pageController.page!;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> fetchData = Offersapi.getAllOffers();
    final size = MediaQuery.of(context).size;
    const marginCenter = EdgeInsets.symmetric(horizontal: 50, vertical: 15);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
              child: Column(children: [
            Expanded(
                child: Container(
                    height: size.height * 0.50,
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
                            return PageView.builder(
                                controller: _pageController,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data[index];
                                  final t = (index - _pageNotifier.value);
                                  final rotationY = lerpDouble(0, 90, t);
                                  final translationX = lerpDouble(0, -50, t);
                                  final scale = lerpDouble(0, -0.2, t);
                                  final translationXShoes =
                                      lerpDouble(0, 150, t);
                                  final rotationShoe = lerpDouble(0, -45, t);
                                  final transform = Matrix4.identity();
                                  transform.translate(translationX);
                                  transform.setEntry(3, 2, 0.001);
                                  transform.scale(1 - scale!);
                                  transform.rotateY(vector.radians(rotationY!));

                                  final transformShoe = Matrix4.identity();
                                  transformShoe.translate(translationXShoes);
                                  transformShoe
                                      .rotateZ(vector.radians(rotationShoe!));
                                  return FlipCard(
                                    direction: FlipDirection.HORIZONTAL,
                                    front: buildpadding(
                                      const EdgeInsets.only(left: 0),
                                      buildpadding(
                                        const EdgeInsets.symmetric(
                                          vertical: 1.0,
                                        ),
                                        InkWell(
                                          // onTap: () {
                                          // Navigator.of(context).push(PageRouteBuilder(
                                          //   transitionDuration:
                                          //       const Duration(milliseconds: 800),
                                          //   pageBuilder: (_, animation, __) =>
                                          //       FadeTransition(
                                          //     opacity: animation,
                                          //     child: ShoesStoreDetailPage(
                                          //       shoe: shoes[index],
                                          //     ),
                                          //   ),
                                          // ));
                                          // },
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: transform,
                                            child: Stack(
                                              children: [
                                                Card(
                                                  elevation: 6,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  margin: marginCenter,
                                                  color: Colors.primaries[
                                                      index %
                                                          Colors.primaries
                                                              .length],
                                                  child:
                                                      const SizedBox.expand(),
                                                ),
                                                Container(
                                                  margin: marginCenter,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 12.0,
                                                          left: 12.0,
                                                          top: 5,
                                                          bottom: 20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            //              Positioned(
                                                            //               top: 20,
                                                            //               left: 20,
                                                            //   child: RotatedBox(
                                                            //     quarterTurns: 3,
                                                            //     child: Container(
                                                            //       child: buildpadding(
                                                            //         const EdgeInsets.symmetric(
                                                            //             horizontal: 18.0,
                                                            //             vertical: 4),
                                                            //         Text(
                                                            //           'جديد',
                                                            //           style: TextStyle(
                                                            //             color: Colors.white,
                                                            //             fontSize: 12,
                                                            //           ),
                                                            //         ),
                                                            //       ),
                                                            //       color: Colors.pinkAccent,
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                            Expanded(
                                                              child: Text(
                                                                data.networkId
                                                                    .nameA
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),

                                                            Center(
                                                              child: Transform(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                transform:
                                                                    transformShoe,
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 40,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                    '$uri/${data.networkId.img}',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          children: [
                                                            Expanded(
                                                              child: buildRow(
                                                                data.package
                                                                    .toString(),
                                                                'ريال',
                                                                'الفئة',
                                                                StyleWidget
                                                                    .white,
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: buildRow(
                                                                  data.packageTime
                                                                      .toString(),
                                                                  data.detailsTime
                                                                      .toString(),
                                                                  'الوقت',
                                                                  StyleWidget
                                                                      .white,
                                                                  MainAxisAlignment
                                                                      .spaceBetween),
                                                            ),
                                                            Expanded(
                                                              child: buildRow(
                                                                  data.packageData
                                                                      .toString(),
                                                                  data.detailsData
                                                                      .toString(),
                                                                  'البيانات',
                                                                  StyleWidget
                                                                      .white,
                                                                  MainAxisAlignment
                                                                      .spaceBetween),
                                                            ),
                                                            Expanded(
                                                              child: buildRow(
                                                                  data.packageValidity
                                                                      .toString(),
                                                                  data.detailsValidity
                                                                      .toString(),
                                                                  'الصلاحية',
                                                                  StyleWidget
                                                                      .white,
                                                                  MainAxisAlignment
                                                                      .spaceBetween),
                                                            ),
                                                            Expanded(
                                                              child: buildRow(
                                                                  data.packageValidity
                                                                      .toString(),
                                                                  data.detailsValidity
                                                                      .toString(),
                                                                  'ينتهي بعد',
                                                                  StyleWidget
                                                                      .white,
                                                                  MainAxisAlignment
                                                                      .spaceBetween),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        children: [
                                                          ts(
                                                              '   المزيد   ',
                                                              TextStyle(
                                                                  color:
                                                                      StyleWidget
                                                                          .white,
                                                                  fontFamily:
                                                                      StyleWidget
                                                                          .fontName)),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color:
                                                                  Colors.white,
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
                                        ),
                                      ),
                                    ),
                                    back: buildpadding(
                                      const EdgeInsets.symmetric(
                                        vertical: 1.0,
                                      ),
                                      Card(
                                        margin: marginCenter,
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.primaries[
                                            index % Colors.primaries.length],
                                        child: SingleChildScrollView(
                                          child: Column(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              ts(
                                                  'مناسبة العرض :',
                                                  TextStyle(
                                                      color: StyleWidget.white,
                                                      fontFamily:
                                                          StyleWidget.fontName,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              buildpadding(
                                                  EdgeInsets.all(10),
                                                  ts(
                                                      data.offers.toString(),
                                                      TextStyle(
                                                          color:
                                                              StyleWidget.white,
                                                          fontFamily:
                                                              StyleWidget
                                                                  .fontName,
                                                          fontWeight:
                                                              FontWeight.bold)))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        })))
          ])),
          _buildBottom(context),
        ]),
      ),
    );
  }
}

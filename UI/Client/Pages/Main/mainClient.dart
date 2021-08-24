import 'dart:ui';
import '../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../.././UI/Client/Pages/Main/bodyMain.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../.././Api/Manager/Models/Package.dart';
import '../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../.././UI/Manager/widget/Pages/Third_Screen/Details_bouquet.dart';
import '../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../.././UI/Manager/widget/widget_public.dart';

import 'bodyMain.dart';

const leftMargin = 40.0;

class Ball {
  final int price;
  final String model;
  final String name;
  final String image;
  final Color color;
  final Color textColor;

  const Ball({
    required this.price,
    required this.model,
    required this.name,
    required this.image,
    required this.color,
    required this.textColor,
  });
}

//24,30,31
const balls = [
  const Ball(
      price: 24,
      name: 'اسمر ماكس',
      model: 'Armory Black',
      color: Colors.black,
      textColor: Colors.white,
      image: 'assets/Osama.jpeg'),
  const Ball(
      price: 30,
      name: 'الصرخة',
      model: 'UEFA blue',
      color: Color(0xFF07205A),
      textColor: Colors.white,
      image: 'assets/runner.png'),
  const Ball(
      price: 31,
      name: 'سماء نت',
      model: 'UEFA Turquoise',
      color: Color(0xFF6EE897),
      textColor: Colors.black,
      image: 'assets/runner.png'),
  const Ball(
      price: 40,
      name: 'سام نت',
      model: 'UEFA 2016',
      color: Color(0xFF743AD6),
      textColor: Colors.white,
      image: 'assets/runner.png'),
];

class MainClient extends StatefulWidget {
  @override
  _MainClient createState() => _MainClient();
}

class _MainClient extends State<MainClient> {
  final _priceNotifier = ValueNotifier<int>(balls.first.price);

  final _pageController = PageController(viewportFraction: 0.9);
  bool ontap = false;
  final _pageNotifier = ValueNotifier<double>(0.0);
 
  void _listener() {
    _pageNotifier.value = _pageController.page!;
    setState(() {});
  }

  int size = 220;
  double sizedboxe = 30;
  @override
  void initState() {
    lastPrice = balls.first.price;
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
    _priceNotifier.dispose();
    super.dispose();
  }

  int lastPrice = 0;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 411) {
      size = 247;
    } else if (MediaQuery.of(context).size.width > 399) {
      print('najeebsss');
      size = 243;
    }
    if (MediaQuery.of(context).size.height > 797 & 737) {
      print('najeeb');

      size = 271;
    }
    Future<List<Package>?> fetchTask3 =
        packageApi.getAllPackagePrice(
          // '6095ba652b3b5f0d3c1e7e9c'

            networkId
            );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _buildHeader(),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 11, left: 11),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 1, right: 1, top: 5, bottom: 0),
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
                              color: StyleWidget.grey.withOpacity(0.3),
                              offset: Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: FutureBuilder(
                        future: fetchTask3,
                        builder: (context, AsyncSnapshot snapshot) {
                          print(MediaQuery.of(context).size.height.toString());
                          if (!snapshot.hasData) {
                            return Container(
                              height: MediaQuery.of(context).size.width - size,
                              child: buildCircularProgressIndicator(),
                            );
                            // buildCircularProgressIndicator();
                          } else if (snapshot.data.length == 0) {
                            var theme = Theme.of(context);
                            return buildNoTasks(
                              theme,
                              'لا توجد بيانات',
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                var data = snapshot.data[index];

                                return SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Wrap(
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
                                                columnData(
                                                  (((data.packagePriceId
                                                      .packagePrice))),
                                                  'الرصيد الحالي: ',
                                                  'الف',
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 20,
                                                      width: 2,
                                                      decoration: BoxDecoration(
                                                        color: HexColor(
                                                                '#87A0E5')
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0)),
                                                      ),
                                                    ),
                                                    columnData(
                                                      ((data
                                                          .packageData.length)),
                                                      'اجمالي المشتريات:  ',
                                                      'ريال',
                                                    ),
                                                  ],
                                                ),
                                                sizedBox(
                                                  5,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 20,
                                                      width: 2,
                                                      decoration: BoxDecoration(
                                                        color: HexColor(
                                                                '#F56E98')
                                                            .withOpacity(0.5),
                                                        borderRadius: BorderRadius
                                                            .all(const Radius
                                                                .circular(4.0)),
                                                      ),
                                                    ),
                                                    columnData(
                                                      ((snapshot.data.length)
                                                          .toInt()),
                                                      'اجمالي المبيعات:  ',
                                                      'ريال',
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height:
                                                          (snapshot.data.length)
                                                                  .toInt() -
                                                              0.0,
                                                      width: 2,
                                                      decoration: BoxDecoration(
                                                        color: HexColor(
                                                                '#F76E99')
                                                            .withOpacity(0.5),
                                                        borderRadius: BorderRadius
                                                            .all(const Radius
                                                                .circular(4.0)),
                                                      ),
                                                    ),
                                                    columnData(
                                                      ((snapshot.data.length)
                                                          .toInt()),
                                                      'المدخول اليومي :  ',
                                                      'ريال',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              width: 25,
                                            ),

                                            //This Circal Animation
                                            Center(
                                              child: Stack(
                                                overflow: Overflow.visible,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 4,
                                                            right: 5,
                                                            top: 4,
                                                            left: 0),
                                                    child: Container(
                                                      width: 85,
                                                      height: 85,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            StyleWidget.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                              100.0),
                                                        ),
                                                        border: new Border.all(
                                                            width: 4,
                                                            color: StyleWidget
                                                                .nearlyDarkBlue
                                                                .withOpacity(
                                                                    0.2)),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            '\%${((snapshot.data.length).toInt())}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  StyleWidget
                                                                      .fontName,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 20,
                                                              letterSpacing:
                                                                  0.0,
                                                              color: StyleWidget
                                                                  .nearlyDarkBlue,
                                                            ),
                                                          ),
                                                          Text(
                                                            'نسبة الارباح',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                              letterSpacing:
                                                                  0.0,
                                                              color: StyleWidget
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 1,
                                                    ),
                                                    child: CustomPaint(
                                                      painter: CurvePainter(
                                                          colors: [
                                                            StyleWidget
                                                                .nearlyDarkBlue,
                                                            HexColor("#8A98E8"),
                                                            HexColor("#8A98E8")
                                                          ],
                                                          angle: 1 +
                                                              (360 - 360) -
                                                              (1.0 -
                                                                  (((snapshot
                                                                      .data
                                                                      .length))))),
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
                                      height: 10,
                                    ),
                                  ],
                                ));
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            sizedBox(
              15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 11, left: 11),
              child: Divider(
                color: Color(0xFF201F1F),
                height: 5.5,
              ),
            ),
            sizedBox(
              10,
            ),

            // sizedBox(sizedboxe),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(':شبكات با القرب منك',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: StyleWidget.deactivatedText,
                        )),
                  ),
                ],
              ),
            ),
            sizedBox(30),
            // Expanded(
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 / 1.100,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    width: MediaQuery.of(context).size.width / 3,
                    bottom: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: leftMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            'الحديدة',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          Spacer(),
                          Text(
                            'تقييم الشبكة',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                          ValueListenableBuilder<int>(
                              valueListenable: _priceNotifier,
                              builder: (context, value, child) {
                                return TweenAnimationBuilder<int>(
                                  duration: const Duration(milliseconds: 0),
                                  tween: IntTween(begin: lastPrice, end: value),
                                  builder: (context, animationValue, child) {
                                    return Text(
                                      "\%$animationValue",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: StyleWidget.deactivatedText,
                                      ),
                                    );
                                  },
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlineButton(
                                    onPressed: null,
                                    child: Text(
                                      '3',
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: OutlineButton(
                                    onPressed: null,
                                    child: Text(
                                      '4',
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: OutlineButton(
                                    onPressed: null,
                                    child: Text(
                                      '5',
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ValueListenableBuilder<double>(
                    valueListenable: _pageNotifier,
                    builder: (context, value, child) => PageView.builder(
                      controller: _pageController,
                      itemCount: balls.length,
                      onPageChanged: (index) {
                        _priceNotifier.value = balls[index].price;
                        lastPrice = balls[index].price;
                      },
                      itemBuilder: (context, index) {
                        final lerp = lerpDouble(
                            1, 0, (index - _pageNotifier.value).abs());

                        double opacity = lerpDouble(
                            1.0, 0.0, (index - _pageNotifier.value).abs())!;
                        opacity = opacity < 0 ? 0 : opacity;
                        return Opacity(
                          opacity: opacity,
                          child: Stack(
                            overflow: Overflow.visible,
                            fit: StackFit.expand,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        left: 20,
                                      ),
                                      child: Hero(
                                        tag: 'hero_text_${balls[index].name}',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            balls[index].name,
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 500),
                                          pageBuilder: (_, animation, __) =>
                                              FadeTransition(
                                            opacity: animation,
                                            child: BodyMain(
                                              ball: balls[index],
                                            ),
                                          ),
                                        ));
                                      },
                                      child: Hero(
                                        tag:
                                            'hero_background_${balls[index].name}',
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: balls[index].color,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'اضافة تعليق',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color: balls[index]
                                                                .textColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: StyleWidget
                                                                  .white,
                                                            ),
                                                            onPressed: () {})
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                            icon: Icon(
                                                                Icons
                                                                    .star_half_sharp,
                                                                color: ontap
                                                                    ? Color(
                                                                        0xFF2FA2FF)
                                                                    : StyleWidget
                                                                        .white),
                                                            onPressed: () {
                                                              validiatstar();
                                                            }),
                                                        IconButton(
                                                            icon: Icon(
                                                                Icons
                                                                    .star_outline_sharp,
                                                                color: ontap
                                                                    ? Color(
                                                                        0xFF2FA2FF)
                                                                    : StyleWidget
                                                                        .white),
                                                            onPressed: () {
                                                              validiatstar();
                                                            }),
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons
                                                                  .star_outline_sharp,
                                                              color: ontap
                                                                  ? Color(
                                                                      0xFF2FA2FF)
                                                                  : StyleWidget
                                                                      .white,
                                                            ),
                                                            onPressed: () {
                                                              validiatstar();
                                                            }),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Transform.scale(
                                  alignment: Alignment.centerRight,
                                  scale: lerp!,
                                  child: Hero(
                                    tag: 'hero_ball_${balls[index].name}',
                                    child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width /
                                                7.2,
                                        backgroundImage: AssetImage(
                                          balls[index].image,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            sizedBox(
              20,
            ),
            // _buildBottomWidget(),
          ],
        ),
      ),
    );
  }

  void validiatstar() {
    if (ontap == true) {
      setState(() {
        ontap = false;
      });
    } else {
      setState(() {
        ontap = true;
      });
    }
  }
}

columnData(data, String text1, text2) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: -0.1,
                color: StyleWidget.grey.withOpacity(0.5),
              ),
            ),
            Text(
              '${data} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: StyleWidget.darkerText,
              ),
            ),
            Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: -0.1,
                color: StyleWidget.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class CurvePainter extends CustomPainter {
  final double angle;
  final List<Color> colors;

  CurvePainter({required this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors;
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }
    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}

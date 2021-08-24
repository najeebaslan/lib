import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wirless_wifi/Api/Manager/Models/offers.dart';
import 'package:wirless_wifi/UI/Manager/widget/style_app/Style_widget.dart';
import '../../../widget_public.dart';
import 'credit_card.dart';

class CreditCardWidget extends StatefulWidget {
  final CreditCard card;

  final bool isDetail;
  final VoidCallback onTap;
  final Offers offers;

  const CreditCardWidget({
    Key? key,
    required this.card,
    this.isDetail = false,
    required this.onTap,
    required this.offers,
  }) : super(key: key);

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState(offers);
}

class _CreditCardWidgetState extends State<CreditCardWidget>
    with SingleTickerProviderStateMixin {
  Offset _currentDraggingOffset = Offset.zero;
  double _lastOffsetDy = 0.0;
  late AnimationController _animationController;

  _CreditCardWidgetState(this.offers);

  void _onDragEnd(DragEndDetails details) {
    _lastOffsetDy = _currentDraggingOffset.dy;
    final animation = Tween<double>(begin: _lastOffsetDy, end: 0.0)
        .animate(_animationController);
    animation.addListener(() {
      if (mounted) {
        setState(() {
          _lastOffsetDy = animation.value;
          _currentDraggingOffset = Offset(0.0, _lastOffsetDy);
        });
      }
    });
    if (!_animationController.isAnimating)
      _animationController.forward(from: 0.0);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _lastOffsetDy += details.primaryDelta!;
    if (_lastOffsetDy < -180) {
      _lastOffsetDy = -180.0;
    }
    if (_lastOffsetDy > 180) {
      _lastOffsetDy = 180.0;
    }
    setState(() {
      _currentDraggingOffset = Offset(0.0, _lastOffsetDy);
    });
  }

  late AnimationController controller;
  late Animation<String> animation;
  final Offers offers;

  var namenetwork;
  getNaneNetwork() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    setState(() {
      namenetwork = myPrefs.getString('namenetwork');
    });
  }

  @override
  void initState() {
    super.initState();
    String message = offers.offers;
    getNaneNetwork();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = TypewriterTween(end: message).animate(_animationController);
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    // _animationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return Hero(
        tag: widget.card.number,
        flightShuttleBuilder: (
          _,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          final Widget toHero = toHeroContext.widget;
          final Widget fromHero = toHeroContext.widget;
          return AnimatedBuilder(
            animation: animation,
            child:
                flightDirection == HeroFlightDirection.push ? fromHero : toHero,
            builder: (context, child) {
              double rotateZ = 0.0;
              final t = Curves.slowMiddle.transform(animation.value);
              if (flightDirection == HeroFlightDirection.push) {
                rotateZ = lerpDouble(-90, 0, t)!;
              } else {
                rotateZ = lerpDouble(0, 90, t)!;
              }
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ((math.pi / 180) * rotateZ),
                child: child,
              );
            },
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final rotationRequired = !widget.isDetail;

            final canAnimate = widget.isDetail &&
                (ModalRoute.of(context)?.animation?.value ?? 0.0) == 1.0;
            final currentAngle = (math.pi / 180) * (_currentDraggingOffset.dy);
            final currentAngleBack =
                (math.pi / 180) * (_currentDraggingOffset.dy + 180);

            final displayBack = (currentAngle < -1.5 || currentAngle > 1.5);
            return Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: widget.onTap,
                onVerticalDragEnd: canAnimate ? _onDragEnd : null,
                onVerticalDragUpdate: canAnimate ? _onDragUpdate : null,
                child: Stack(
                  children: [
                    Text('الرقم التسلسلي'),
                    Opacity(
                      opacity: displayBack ? 0.0 : 1.0,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: !canAnimate
                            ? Matrix4.identity()
                            : (Matrix4.identity()
                              ..setEntry(3, 2, 0.002)
                              ..rotateX(
                                currentAngle,
                              )),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                constraints.maxWidth * 0.05),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [
                                0.3,
                                1.0,
                              ],
                              colors: [
                                widget.card.color,
                                Colors.grey,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RotatedBox(
                              quarterTurns: rotationRequired ? -1 : 0,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      canAnimate
                                          ? buildditealdata(
                                              context,
                                              '  ينتهي العرض بعد: ',
                                              '${widget.offers.limiteUptime}',
                                              ' ${widget.offers.detailsLimiteUptime}',
                                            )
                                          : Expanded(
                                              child: Text(
                                                'عرض خاص',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: canAnimate ? 70.0 : 0),
                                        child: RotatedBox(
                                          quarterTurns: 1,
                                          child: Icon(
                                            Icons.wifi,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    flex: widget.isDetail ? 5 : 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            'assets/card/chip_logo.png',
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        canAnimate
                                            ? buildditealdata(
                                                context,
                                                'الوقت : ',
                                                '${widget.offers.packageTime}',
                                                ' ${widget.offers.detailsTime}',
                                              )
                                            : const SizedBox.shrink(),
                                        canAnimate
                                            ? buildditealdata(
                                                context,
                                                'الصلاحية : ',
                                                '${widget.offers.packageValidity}',
                                                ' ${widget.offers.detailsValidity}',
                                              )
                                            : const SizedBox.shrink(),
                                        canAnimate
                                            ? buildditealdata(
                                                context,
                                                'البيانات : ',
                                                '${widget.offers.packageData}',
                                                ' ${widget.offers.detailsData}',
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            ts(
                                              namenetwork.toString(),
                                              TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.offers.package.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white,
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
                        ),
                      ),
                    ),
                    if (canAnimate && displayBack)
                      Positioned.fill(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: !canAnimate
                              ? Matrix4.identity()
                              : (Matrix4.identity()
                                ..setEntry(3, 2, 0.002)
                                ..rotateX(
                                  currentAngleBack,
                                )),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * 0.05),
                              color: widget.card.color,
                            ),
                            child: Column(
                              children: [
                                Spacer(),
                                Expanded(
                                  child: Container(
                                    color: Colors.black26,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                              child: Container(
                                                color: Colors.white,
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  widget.card.ccv,
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AnimatedBuilder(
                                                animation: animation,
                                                builder: (context, child) {
                                                  return Wrap(
                                                    children: [
                                                      ts(
                                                          '    مناسبة العرض  : ${animation.value}',
                                                          TextStyle(
                                                              color: StyleWidget
                                                                  .white,
                                                              fontFamily:
                                                                  StyleWidget
                                                                      .fontName)),
                                                    ],
                                                  );
                                                })),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  buildditealdata(
      BuildContext context, String text1, String text2, String text3) {
    return Expanded(
        flex: 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: RichText(
            text: TextSpan(
              text: '',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: text1,
                    //  'الوقت : ',
                    style: const TextStyle(
                      color: StyleWidget.white,
                      fontFamily: StyleWidget.fontName,
                    )),
                TextSpan(
                    text: text2,
                    // '${widget.offers.packageTime}',
                    style: const TextStyle(
                      color: StyleWidget.dark_grey,
                      fontWeight: FontWeight.w600,
                      fontFamily: StyleWidget.fontName,
                    )),
                TextSpan(
                    text: text3,
                    // ' ${widget.offers.detailsTime}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: StyleWidget.white,
                      fontFamily: StyleWidget.fontName,
                    )),
              ],
            ),
          ),
        ));
  }
}

class TypewriterTween extends Tween<String> {
  TypewriterTween({String begin = '', String? end})
      : super(begin: begin, end: end);

  String lerp(double t) {
    var cutoff = (end!.length * t).round();
    return end!.substring(0, cutoff);
  }
}

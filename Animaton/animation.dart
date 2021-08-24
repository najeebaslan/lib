import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:wirless_wifi/UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import 'package:wirless_wifi/UI/Manager/widget/style_app/Style_widget.dart';
import 'package:badges/badges.dart';

class DemoApp extends StatefulWidget {
  /* اضهار التعليمات للمستخدم */
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(context, <String>[
        'feature1',
        'feature2',
        'feature3',
        'feature4',
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DescribedFeatureOverlay(
            featureId: 'feature2',
            targetColor: Colors.white,
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            contentLocation: ContentLocation.below,
            title: Text(
              'Menu Icon',
              style: TextStyle(fontSize: 20.0),
            ),
            pulseDuration: Duration(seconds: 1),
            enablePulsingAnimation: true,
            overflowMode: OverflowMode.clipContent,
            openDuration: Duration(seconds: 1),
            description: Text(
                'This is Button you can add more details heres\n New Info here add more!'),
            tapTarget: Icon(Icons.menu),
            child: IconButton(icon: Icon(Icons.menu), onPressed: () {})),
        title: Text('Demo App'),
        centerTitle: true,
        actions: [
          DescribedFeatureOverlay(
              featureId: 'feature3',
              targetColor: Colors.white,
              textColor: Colors.black,
              backgroundColor: Colors.amber,
              contentLocation: ContentLocation.trivial,
              title: Text(
                'More Icon',
                style: TextStyle(fontSize: 20.0),
              ),
              pulseDuration: Duration(seconds: 1),
              enablePulsingAnimation: true,
              barrierDismissible: false,
              overflowMode: OverflowMode.wrapBackground,
              openDuration: Duration(seconds: 1),
              description:
                  Text('This is Button you can add more details heres'),
              tapTarget: Icon(Icons.search),
              child: IconButton(icon: Icon(Icons.search), onPressed: () {})),
        ],
      ),
      body: Center(
        child: Container(
          child: DescribedFeatureOverlay(
            featureId: 'feature1',
            targetColor: Colors.white,
            textColor: Colors.black,
            backgroundColor: Colors.purpleAccent,
            contentLocation: ContentLocation.above,
            title: Text(
              'This is Button',
              style: TextStyle(fontSize: 20.0),
            ),
            pulseDuration: Duration(seconds: 1),
            enablePulsingAnimation: true,
            barrierDismissible: false,
            overflowMode: OverflowMode.extendBackground,
            openDuration: Duration(seconds: 1),
            description: Text('This is Button you can add more details heres'),
            tapTarget: Icon(Icons.radio_button_unchecked),
            child: RaisedButton(
              child: Text('Button'),
              onPressed: () {},
              color: Colors.green,
            ),
          ),
        ),
      ),
      bottomNavigationBar: DescribedFeatureOverlay(
        featureId: 'feature4',
        targetColor: Colors.white,
        textColor: Colors.black,
        backgroundColor: Colors.lightGreenAccent,
        contentLocation: ContentLocation.trivial,
        title: Text(
          'This is Button',
          style: TextStyle(fontSize: 20.0),
        ),
        pulseDuration: Duration(seconds: 1),
        enablePulsingAnimation: true,
        overflowMode: OverflowMode.extendBackground,
        openDuration: Duration(seconds: 1),
        description: Text('This is Button you can\n add more details heres'),
        tapTarget: Icon(Icons.navigation),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(title: Text('Done!'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('Notification'),
              icon: Icon(Icons.notifications_active)),
        ]),
      ),
    );
  }
}

//....................................................................................
//....................................................................................
//....................................................................................
//....................................................................................
//....................................................................................
//....................................................................................

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key? key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: kIcons),
                ),
              ),
              RaisedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context)!;
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
//..................................................................................
//..................................................................................
//..................................................................................

class ColorPIcker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<ColorPIcker> {
  bool lightTheme = true;
  Color currentColor = Colors.limeAccent;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                const Tab(text: 'HSV'),
                const Tab(text: 'Material'),
                const Tab(text: 'Block'),
              ],
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 3.0,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: currentColor,
                                onColorChanged: changeColor,
                                colorPickerWidth: 300.0,
                                pickerAreaHeightPercent: 0.7,
                                enableAlpha: true,
                                displayThumbColor: true,
                                showLabel: true,
                                paletteType: PaletteType.hsv,
                                pickerAreaBorderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(2.0),
                                  topRight: const Radius.circular(2.0),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Change me'),
                    color: currentColor,
                    textColor: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                  RaisedButton(
                    elevation: 3.0,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            content: SingleChildScrollView(
                              child: SlidePicker(
                                pickerColor: currentColor,
                                onColorChanged: changeColor,
                                paletteType: PaletteType.rgb,
                                enableAlpha: false,
                                displayThumbColor: true,
                                showLabel: false,
                                showIndicator: true,
                                indicatorBorderRadius:
                                    const BorderRadius.vertical(
                                  top: const Radius.circular(25.0),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Change me again'),
                    color: currentColor,
                    textColor: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                ],
              ),
              Center(
                child: RaisedButton(
                  elevation: 3.0,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.all(0.0),
                          contentPadding: const EdgeInsets.all(0.0),
                          content: SingleChildScrollView(
                            child: MaterialPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              enableLabel: true,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Change me'),
                  color: currentColor,
                  textColor: useWhiteForeground(currentColor)
                      ? const Color(0xffffffff)
                      : const Color(0xff000000),
                ),
              ),
              Center(
                child: RaisedButton(
                  elevation: 3.0,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select a color'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Change me'),
                  color: currentColor,
                  textColor: useWhiteForeground(currentColor)
                      ? const Color(0xffffffff)
                      : const Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//............................................................................abstract

//............................................................................abstract
//............................................................................abstract
//............................................................................abstract

class Animated_Switcher extends StatelessWidget {
  /* اضهار الارقام بشكل متحرك */
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          RaisedButton(
            child: const Text('Increment'),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Liquid extends StatelessWidget {
  final bool isFlipped;
  final AnimationController controller;

  Liquid({
    required this.isFlipped,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStyleModeNotifier>(context);

    final double height = 200.0;

    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.elasticOut,
        transform: Matrix4.identity()
          ..translate(
            0.0,
            isFlipped ? -model.openValue - 100 : model.openValue + 100,
          ),
        decoration: BoxDecoration(
          color: Color(0xFF0E20C7),
          boxShadow: [
            BoxShadow(
              blurRadius: 30.0,
              color: !isFlipped ? Colors.grey[350]! : Colors.white,
              offset: Offset(isFlipped ? -20 : 20, isFlipped ? -30 : 30),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text('nnnn'),
            Transform(
              transform: Matrix4.identity()
                ..scale(1.0, isFlipped ? -1.0 : 1.0)
                ..translate(0.0, isFlipped ? -height * 2 + 50 : -height + 50),
              child: Lottie.asset(
                'assets/data/liquid.json',
                controller: controller,
                animate: false,
                height: height,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color(
                      const ['**', 'Rectangle 1', 'Fill 1'],
                      value: Color(0xFF0E20C7),
                      // value: Colors.red,
                    ),
                    ValueDelegate.color(
                      const ['**', 'Shape 1', 'Fill 1'],
                      value: Color(0xFF0E20C7),
                    )
                    // value: Colors.red),
                  ],
                ),
              ),
            ),
            if (isFlipped)
              SizedBox()
            else
              GestureDetector(
                onTap: () {
                  model.openLiquidMenu(controller);
                },
                child: model.isOpening
                    ? Text('تفاصيل الكرت',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: StyleWidget.fontName,
                            fontSize: 22))
                    : Text(
                        'الكرت',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: StyleWidget.fontName,
                            fontSize: 22),
                      ),
                // NeuCard(
                //   curveType: model.isOpening
                //       ? CurveType.emboss
                //       : CurveType.concave,
                //   width: 88,
                //   height: 88,
                //   bevel: 16,
                //   decoration: NeumorphicDecoration(
                //     color:
                //         model.isOpening ? Global.activeColor : Colors.white,
                //     borderRadius: BorderRadius.circular(8), isForeground: null, renderingByPath: null, shape: null, style: null, splitBackgroundForeground: null,
                //   ),
                //   child: Icon(
                //     model.isOpening ? Icons.lock_open : Icons.lock,
                //     color: Colors.pinkAccent,
                //   ),
                // ),
              ),
          ],
        ),
      ),
    );
  }
}

// class HomeModel extends ChangeNotifier {
//   double _openValue = 0.0;
//   get openValue => _openValue;
//   set openValue(value) {
//     _openValue = value;
//     notifyListeners();
//   }

//   bool _isOpening = false;
//   get isOpening => _isOpening;
//   set isOpening(value) {
//     _isOpening = value;
//     notifyListeners();
//   }

//   void openLiquidMenu(AnimationController controller) {
//     print('Menu is opening..');
//     isOpening = !isOpening;
//     if (isOpening) {
//       openValue = 75.0;
//       controller.forward();
//     } else {
//       openValue = 0.0;
//       controller.reset();
//     }
//     notifyListeners();
//   }
// }

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              'Liquid Menu'.toUpperCase(),
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
            Liquid(
              isFlipped: true,
              controller: _animationController,
            ),
            Liquid(
              isFlipped: false,
              controller: _animationController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Badge(
            animationType: BadgeAnimationType.slide,
            badgeContent: Text('4'),
            child: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
    );
  }
}

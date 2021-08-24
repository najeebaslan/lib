import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././UI/Manager/widget/Drawer/Drawers_Animation.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../.././UI/Manager/widget/Pages/Offers/Add_Offers.dart';
import 'Add_Cards.dart';
import 'BodyMain.dart';
import 'Cards_sold.dart';
import 'Reports_Cards.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<Widget> buildSection1ListItems = [
    const Text(
      'الكروت المباعة',
      style: const TextStyle(fontFamily: StyleWidget.fontName),
      textAlign: TextAlign.center,
    ),
    const Text(
      'العروض',
      style: const TextStyle(fontFamily:StyleWidget.fontName),
      textAlign: TextAlign.center,
    ),
    const Text(
      ' اضافة كروت',
      style: const TextStyle(fontFamily: StyleWidget.fontName),
      textAlign: TextAlign.center,
    ),
    const Text(
      'التقارير',
      style: const TextStyle(fontFamily: StyleWidget.fontName),
      textAlign: TextAlign.center,
    ),
  ];
  final List<Widget> buildindexScreens = [
    CardsSold(),
    StyleAddOffers(),
    AddCards(),
    ReportsCards(),
  ];
  late FSBStatus drawerStatus;

//   @override
//   initState() {
//     super.initState();
//   subscription =
//       Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
//   }

  late Package imageSliders1;
  final List<Widget> imageSliders = [
    // Text('namsdkgsdkfh;sdu'), Text('namsdkgsdkfh;sdu'),
    // Text('namsdkgsdkfh;sdu'),
    // Text('namsdkgsdkfh;sdu'),
    // Text('namsdkgsdkfh;sdu'),

    BodyMain(),
    BodyMain(),
    BodyMain(),
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        body: Theme(
          data: HotelAppTheme.buildLightTheme(),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      height: 175,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 20),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.map((url) {
                  int index = imageSliders.indexOf(url);

                  return Container(
                    width: 8.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.pink : Colors.green),
                  );
                }).toList(),
              ),
              Divider(
                color: Colors.grey.withAlpha(100),
                endIndent: 16,
                height: 10,
                indent: 16,
                thickness: 1,
              ),
              AnimationLimiter(
                  child: GridView.count(
                addSemanticIndexes: true,
                childAspectRatio: 1,
                primary: false,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                ),
                crossAxisSpacing: 1,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: List.generate(buildSection1ListItems.length, (index) {
                  return AnimationConfiguration.staggeredList(
                    // delay: Duration(milliseconds: 200),
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 150,
                      child: FadeInAnimation(
                        child: Container(
                            child: Card(
                          elevation: 2,
                          shadowColor: Colors.black,
                          child: InkWell(
                            onTap: () async {
                              final result =
                                  await Connectivity().checkConnectivity();
                              checkeDatat
                                  ? showConnectivitySnackBar(result, context)
                                  : SizedBox();
                              setState(() {});
                              // print(checkeDatat.toString());
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      buildindexScreens[index]));
                            },
                            child: Column(
                              children: [
                                buildSection1ListItems[index],
                                Expanded(
                                  child: Image.asset(
                                    'assets/home_images/image${index + 1}.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        )),
                      ),
                    ),
                  );
                }),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

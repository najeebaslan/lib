
import 'package:flutter/material.dart';
import '../../.././../../../Api/Manager/Repositorys/Network.dart';
import '../../.././../../../Api/Manager/Repositorys/offers.dart';
import '../../.././../../../UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../.././../../../UI/Manager/widget/functions_public/functions.dart';
import '../../.././../../../UI/Manager/widget/style_app/Style_widget.dart';
import '../../.././../../../UI/Manager/widget/style_app/Them.dart';
import 'credit_card.dart';
import 'credit_card_widget.dart';
import 'credit_cards_concept_detail_page.dart';

//ignore: must_be_immutable
class CreditCardConceptPage extends StatefulWidget {
  const CreditCardConceptPage({
    Key? key,
  }) : super(key: key);
  @override
  _CreditCardConceptPageState createState() => _CreditCardConceptPageState();
}

class _CreditCardConceptPageState extends State<CreditCardConceptPage> {
  final pageNotifier = ValueNotifier(0);
  // late Offers datalingth;
  int _lastPage = 0;
  

  // @override
  // void initState() {
  //   super.initState();

  //  Offersapi.getOffers(networkId);
  // }

  @override
  Widget build(BuildContext context) {
    Future<dynamic?> fetchTask = Offersapi.getOffers(
      // '60933b1bbc58793b9c910986'
     networkId.toString()
      );
    var theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    const padding = EdgeInsets.all(18.0);
    // setState(() {
    //   datalingth;
    //   //  networks.length;
    // });
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        backgroundColor: Color(0xFFA9BADA),
        // appBar: AppBar(
        //   elevation: 5,
        //   iconTheme: const IconThemeData.fallback(),
        //   actions: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         IconButton(
        //           icon: Icon(
        //             Icons.notifications_none,
        //             color: Colors.grey.shade800,
        //           ),
        //           onPressed: () {},
        //         ),
        //       ],
        //     ),
        //   ],
        //   backgroundColor: Color(0xFFF2F3F8),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'العروض المضافة',
                    style: textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Text(
                    'المبيعات',
                    style: textTheme.subtitle2!.copyWith(
                      color: StyleWidget.darkText,
                    ),
                  ),
                  const SizedBox(height: 3),
                  ValueListenableBuilder<int>(
                      valueListenable: pageNotifier,
                      builder: (context, snapshot, _) {
                        final currentCard = creditCards[snapshot];
                        final lastCard = creditCards[_lastPage];
                        return TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: lastCard.amount,
                            end: currentCard.amount,
                          ),
                          duration: const Duration(milliseconds: 500),
                          builder: (_, value, ___) => Text(
                            value.toStringAsFixed(2),
                            style: textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: fetchTask,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return buildCircularProgressIndicator();
                      } else if (snapshot.data.length == 0) {
                        return buildNoTasks(
                          theme,
                          'لا توجد بيانات',
                        );
                      } else {
                        return PageView.builder(
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (page) {
                              _lastPage = pageNotifier.value;
                              pageNotifier.value = page;
                            },
                            controller: PageController(
                              viewportFraction: 0.7,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            //creditCards.length,
                            itemBuilder: (_, index) {
                              var data = snapshot.data[index];
                              print(
                                  '${data.networkId.nameA.toString()}ةةةةةةةةةةةةة');
                              return Align(
                                child: Transform.translate(
                                  offset: Offset(-30.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CreditCardWidget(
                                      onTap: () {
                                        final page =
                                            CreditCardsConceptDetailPage(
                                          card: creditCards[index],
                                          offers: data,
                                        );
                                        Navigator.of(context).push(
                                          PageRouteBuilder<Null>(
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                _) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: page,
                                              );
                                            },
                                            transitionDuration:
                                                Duration(milliseconds: 900),
                                          ),
                                        );
                                      },
                                      card: creditCards[index],
                                      offers: data,
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    })),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}

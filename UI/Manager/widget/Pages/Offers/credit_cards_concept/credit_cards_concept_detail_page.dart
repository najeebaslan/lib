import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wirless_wifi/Api/Manager/Models/offers.dart';
import 'package:wirless_wifi/UI/Manager/widget/style_app/Style_widget.dart';
import 'package:wirless_wifi/UI/Manager/widget/style_app/Them.dart';
import '../../../widget_public.dart';
import 'credit_card.dart';
import 'credit_card_widget.dart';

class CreditCardsConceptDetailPage extends StatefulWidget {
  final CreditCard card;
  final Offers offers;
  CreditCardsConceptDetailPage({Key? key, required this.card, required this.offers})
      : super(key: key);

  @override
  _CreditCardsConceptDetailPageState createState() =>
      _CreditCardsConceptDetailPageState();
}

class _CreditCardsConceptDetailPageState
    extends State<CreditCardsConceptDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        backgroundColor: Color(0xFF606CB3),
        //0xFF4372C9
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                centerTitle: true,
                title: ts(
                    'التعديل  العرض',
                    TextStyle(
                      color: StyleWidget.white,
                    )),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 10,
                      ),
                    ])),

                    SliverPersistentHeader(
                      pinned: true,
                      delegate: MyCardHeaderDelegate(
                        widget.card,
                        170.0,
                       widget. offers,
                      ),
                    ),

                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(
                            height: 10,
                          ),
                          // buildOffer(
                          //   context,
                          //   _formkeypackages,
                          //   _value1,
                          //   _value2,
                          //   _value3,
                          //   _value4,
                          //   setState(() {

                          //   }),
                          //   time,
                          //   validity,
                          //   data,
                          //   offer,
                          //   limiteUptime,
                          //   10.0
                          // ),
                        ],
                      ),
                    ),

                    // SliverList(delegate: [],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCardHeaderDelegate extends SliverPersistentHeaderDelegate {
  final CreditCard card;
  final double height;
  final Offers offers;
  MyCardHeaderDelegate(
    this.card,
    this.height,
    this.offers,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4372C9),
            Color(0xFF4372C9),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: CreditCardWidget(
        onTap: () {},
        card: card,
        isDetail: true,
        offers: offers,
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

const categories = ['Shoes', 'Food', 'Restaurant', 'Hotel'];
final random = Random();

class MovementWidget extends StatelessWidget {
  final int index;

  const MovementWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Movement ${index + 1}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        categories[index % categories.length],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
      ),
      trailing: Text(
        doubleInRange(random, 1, 5000).toStringAsFixed(2),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

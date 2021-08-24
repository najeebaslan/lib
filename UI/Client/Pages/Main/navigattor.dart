import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:wirless_wifi/UI/Client/Pages/Main/mainClient.dart';
import '../../../.././UI/Client/Pages/Offers_Cilent/shoes_store_page.dart';
import '../../../.././UI/Client/Pages/travel_concept/travel_concept_page.dart';
import '../../../.././UI/Manager/widget/Drawer/networkProfile.dart';
import '../../../.././UI/Manager/widget/Pages/Offers/credit_cards_concept/credit_cards_concept_page.dart';
import '../../../.././UI/Manager/widget/widget_public.dart';

// import 'mainClient.dart';

class NavigatorScreens extends StatefulWidget {
  @override
  _NavigatorScreensState createState() => _NavigatorScreensState();
}

class _NavigatorScreensState extends State<NavigatorScreens> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MainClient(),
    CreditCardConceptPage(),
    ShoesStorePage(),
        CreditCardConceptPage(),
    ShoesStorePage(),
    // TravelConceptPage(),
    TravelConceptPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: Scaffold(appBar: 
        
        AppBar(
              leading:  PopupMenuButton<OrderOptions>(
                      itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                        PopupMenuItem<OrderOptions>(
                          child: text("المساعدة و التعليقات"),
                          height: 20,
                          value: OrderOptions.OrderAZ,
                        ),
                      ],
                      // onSelected: _orderList,
                    ),
              elevation: 5,
              iconTheme: const IconThemeData.fallback(),
              title:  Text(
                  'نجيب عسلان',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                       CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreditCardConceptPage()));
                      },
                    ),
             
                   
                  ],
                ),
              ],
              backgroundColor: Color(0xFFF2F3F8),
            ),
            backgroundColor: Colors.white,
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.titled,

              items: [
                TabItem(icon: Icons.home, title: 'الصفحة الرئيسية'),
                TabItem(icon: Icons.shopping_basket, title:'المبيعات'),
                TabItem(icon: Icons.shopping_cart, title: 'العروض'),
                TabItem(icon: Icons.assessment, title:'المشتريات'),
                 TabItem(icon: Icons.shopping_cart, title: 'العروض'),
                TabItem(icon: Icons.assessment, title:'المشتريات'),
                // TabItem(icon: Icons.assessment, title: 'الاعدادات'),
              ],
              initialActiveIndex: 0,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  print(_selectedIndex);
                });
              },
              // (int i) => print('click index=$i'),
            ),
            body:    _widgetOptions[_selectedIndex],));
  }
}


import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'UI/Manager/widget/Pages/Signup/signup_screen.dart';
import 'UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import 'UI/Manager/widget/style_app/Style_widget.dart';
import 'package:flutter/widgets.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ChangeNotifierProvider(
    create: (context) => AppStyleModeNotifier(),
    child:MyApp() ,
  ));
}
//AliAslan@gmail.com
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: FeatureDiscovery(
        recordStepsInSharedPreferences: false,
      child :
      // Badges()
      //HomeView()
      //  DemoApp()
        // ThirdScreenState()
        // SelectedLocation(),
        // TheNetwork(),
            //  MyAppsa(),
            // Flip(),
            // ShimmerNumbers(),
            // ShoesStorePage(),
            // NavigatorScreens(),
            // MainClient(),
            // SelectedLocation()
        // CardsSold(),
        // Test(),
        // CreditCardConceptPage(),
        // DrawerWithAppBar(),
        // StyleAddOffers(),
        // DrawerWithAppBar(),
        SignUpScreen(),
     ) );
  }
}




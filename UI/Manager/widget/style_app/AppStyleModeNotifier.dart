import 'package:flutter/material.dart';

class AppStyleModeNotifier extends ChangeNotifier {
  int mode = 0; //0 for light and 1 for dark

  Color primaryBackgroundColor = Colors.grey[100]!;
  Color? primaryTextColorDark = Colors.grey[900];
  Color? Blue = Colors.blue[200];
  Color White = Colors.white;
  Color Blackandwhite = Colors.black87;
  Color Blueandblack = Colors.blue.shade900;
  Color Whitandgrey = Colors.white;
  Color Blueandgrey = Colors.blue;
  Color Whitandblack = Colors.white;
  Color primaryTextColorLight = Colors.grey;
  Color primaryTextColor = Colors.black;
  Color? primaryTextColor1 = Colors.grey[800];
  Color primaryMessageBoxColor = Colors.blue;
  Color? secondaryMessageBoxColor = Colors.grey[300];
  Color primaryMessageTextColor = Colors.white;
  Color? secondaryMessageTextColor = Colors.grey[800];
  Color? typeMessageBoxColor = Colors.grey[200];
  Color typeMessageContainerColor = Colors.white;
  Color ContainerBackgroundColor = Colors.white;
  Color BackgroundWhiteandbalck = Colors.white;
 double _openValue = 0.0;
  get openValue => _openValue;
  set openValue(value) {
    _openValue = value;
    notifyListeners();
  }

  bool _isOpening = false;
  get isOpening => _isOpening;
  set isOpening(value) {
    _isOpening = value;
    notifyListeners();
  }

  void openLiquidMenu(AnimationController controller) {
    print('Menu is opening..');
    isOpening = !isOpening;
    if (isOpening) {
      openValue = 75.0;
      controller.forward();
    } else {
      openValue = 0.0;
      controller.reset();
    }
    notifyListeners();
  }
  switchMode() {
    if (mode == 0) {
      //if it is light mode currently switch to dark
      primaryBackgroundColor = Colors.black;
      primaryTextColorDark = Colors.grey[00];
      White = Colors.white;
      Blue = Colors.grey[500];
      Blackandwhite = Colors.white;
      Blueandblack = Colors.black87;
      Whitandgrey = Color(0xFF011016);
      //  Whitandgrey = Color(0xFF011016);
      Blueandgrey = Colors.white10;
      Whitandblack = Colors.black87;
      primaryTextColorLight = Colors.grey;
      primaryTextColor = Colors.grey[300]!;
      primaryMessageBoxColor = Colors.blue;
      secondaryMessageBoxColor = Colors.grey[800];
      primaryMessageTextColor = Colors.white;
      secondaryMessageTextColor = Colors.white;
      typeMessageBoxColor = Colors.grey[800];
      typeMessageContainerColor = Colors.black;
      ContainerBackgroundColor = Colors.black;
      BackgroundWhiteandbalck = Colors.black;

      mode = 1;
    } else {
      //if it is dark mode currently switch to light
      primaryBackgroundColor = Colors.grey[100]!;
      primaryTextColorDark = Colors.grey[900];
      White = Colors.white;

      Blue = Colors.blue[200];
      Blackandwhite = Colors.black;
      Blueandblack = Colors.blue.shade900;
      Whitandgrey = Colors.white;
      Blueandgrey = Colors.blue;
      Whitandblack = Colors.white;
      primaryTextColorLight = Colors.grey;
      primaryTextColor = Colors.black;
      primaryMessageBoxColor = Colors.blue;
      secondaryMessageBoxColor = Colors.grey[300];
      primaryMessageTextColor = Colors.white;
      secondaryMessageTextColor = Colors.grey[800];
      typeMessageBoxColor = Colors.grey[200];
      typeMessageContainerColor = Colors.blue.shade900;
      ContainerBackgroundColor = Colors.white;
      BackgroundWhiteandbalck = Colors.white;
      mode = 0;
    }

    notifyListeners();
  }
}

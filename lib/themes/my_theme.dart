import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.grey.shade100,
          accentColor: Colors.yellow,
          textTheme: TextTheme(
              headline3: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Georgia',
                color: Colors.yellow.shade600,
              ),
              subtitle1:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        );
      case ThemeType.Dark:
        return ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Georgia',
            ),
            subtitle1: TextStyle(fontSize: 16.0, color: Colors.grey.shade400),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Hind',
                color: Colors.grey.shade300
            ),
          ),
        );
      case ThemeType.Dim:
        return ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.grey.shade100,
          unselectedWidgetColor: Colors.grey,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Georgia',
            ),
            subtitle1: TextStyle(fontSize: 16.0, color: Colors.grey.shade400),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Hind',
                color: Colors.grey.shade300
            ),
          ),
        );
      case ThemeType.Dash:
        return ThemeData(
          accentColor: Colors.white,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Color(0xff0B40A7),
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
            ),
            subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Hind',
                color: Colors.grey.shade300
            ),
          ),
        );
      case ThemeType.Flutterista:
        return ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Color(0xff9C59D1),
          accentColor: Colors.white,
          unselectedWidgetColor: Color(0Xff3C0B9A),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontFamily: 'Georgia',
            ),
            subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontWeight:FontWeight.bold,
                fontFamily: 'Hind',
                color: Colors.grey.shade300
            ),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Dim,
  Dash,
  Flutterista,
}

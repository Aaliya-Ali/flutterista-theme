import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scenery_painter.dart';
import 'themes/custom_themes.dart';
import 'themes/my_theme.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor:
                  CustomWidgetThemes.of(context).sceneryThemeData!.skyFillColor,
              waterColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .waterFillColor,
              mountainColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .mountainFillColor,
              textHeight: _textAreaHeight,
              drawSun: CustomWidgetThemes.of(context).sceneryThemeData!.drawSun,
              drawMoon:
                  CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon,
            ),
            child: Container(),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              height: _textAreaHeight,
              width: constraints.maxWidth,
              child: const SomeText(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: constraints.maxWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                            title: const Text(
                              'Light',
                            ),
                            groupValue: myTheme.themeType,
                            value: ThemeType.Light,
                            onChanged: (ThemeType? mode) =>
                                myTheme.setThemeType(ThemeType.Light),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                            title: const Text('Dark'),
                            groupValue: myTheme.themeType,
                            value: ThemeType.Dark,
                            onChanged: (ThemeType? mode) =>
                                myTheme.setThemeType(ThemeType.Dark),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                            title: const Text('Dim'),
                            groupValue: myTheme.themeType,
                            value: ThemeType.Dim,
                            onChanged: (ThemeType? mode) =>
                                myTheme.setThemeType(ThemeType.Dim),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                            title: const Text(
                              'Dash',
                            ),
                            groupValue: myTheme.themeType,
                            value: ThemeType.Dash,
                            onChanged: (ThemeType? mode) =>
                                myTheme.setThemeType(ThemeType.Dash),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                            title: const Text('Flutterista'),
                            groupValue: myTheme.themeType,
                            value: ThemeType.Flutterista,
                            onChanged: (ThemeType? mode) =>
                                myTheme.setThemeType(ThemeType.Flutterista),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flaiku',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Anonymous',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Text(
          'Hello, Flutter Friend!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Welcome to my solution of Flutter Challenge',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'I hope you have fun :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

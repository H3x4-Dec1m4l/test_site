import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:my_site_portfolio/view/portfolio_page.dart';
import './utils/routes.dart';
import './view/home_page_screen.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.theme}) : super(key: key);

  final ThemeData? theme;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Locale? _locale;
  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [
      'assets/lang/titles',
      'assets/lang/texts'
    ];
    return MaterialApp(
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        if (locale?.languageCode == 'en') {
          return Locale('en', 'US');
        }
        return Locale('pt', 'BR');
      },
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      title: 'TryPol-y' /* futuro titulo */,
      theme: ThemeData.dark(),
      routes: {
        AppRoutes.HOME_PAGE: (ctx) => HomePage(),
        AppRoutes.PORTFOLIO_PAGE: (ctx) => PortfolioPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'view/home_page/home_page.dart';
import 'view/portfolio_page/portfolio_page.dart';
import 'view/home_page/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Effry Muhammad Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/portfolio': (context) => const PortfolioPage(),
      },
    );
  }
}

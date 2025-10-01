import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'providers/theme_provide.dart';

class BmogulApp extends StatelessWidget{

  const BmogulApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    // TODO: implement build
    return MaterialApp(
      title: 'Burhanuddin Mogul',
      initialRoute: '/',
      routes: {
      '/': (BuildContext context) => const HomePage(),
    },
      theme: themeProvider.currentTheme,
    );
  }
}

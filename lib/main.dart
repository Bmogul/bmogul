import 'package:bmogul/providers/github.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/theme_provide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => GitHubProvider()),
      ],
      child: const BmogulApp(),
    ),
  );
}

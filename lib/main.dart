import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/theme_provide.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const BmogulApp(),
  ),
);

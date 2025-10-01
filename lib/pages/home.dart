import 'package:bmogul/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);

    var lastBuild = 3;
    var activeProjects = 4;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                print('Menu');
              },
              icon: Icon(Icons.menu),
            ),
          ],
        ),
        title: Row(
          children: [Icon(Icons.terminal), Text('Control_Center', style: theme.textTheme.titleLarge,)],
        ),
        actions: [
          Text('System Active'),
          SizedBox(width: 15),
          Text('Last Updated: ${lastBuild}h ago'),
          SizedBox(width: 15),
          Text('Active Projects: ${activeProjects}'),
          IconButton(
            onPressed: () {
              print('Toggle theme');
              themeProvider.toggleTheme();
            },
            icon: Icon(
              themeProvider.isLight ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: Text("Hello", style: theme.textTheme.displayLarge),
    );
  }
}

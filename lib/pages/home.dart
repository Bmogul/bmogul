import 'package:bmogul/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:bmogul/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  // custom navigationraildestination widget
  NavigationRailDestination _customDestination({
    required Icon icon,
    required String label,
    required bool isSelected,
    required ThemeData theme,
    required bool isExtended,
  }) {
    return NavigationRailDestination(icon: icon, label: Text(label));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);

    var lastBuild = 3;
    var activeProjects = 4;

    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
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
              children: [Icon(Icons.terminal), Text('Control_Center')],
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
          body: Row(
            children: [
              Container(
                width: 250,
                color: theme.colorScheme.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'MAIN',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                      selected: selectedIndex == 0,
                      onTap: () => setState(() => selectedIndex = 0),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Overview'),
                      selected: selectedIndex == 1,
                      onTap: () => setState(() => selectedIndex = 1),
                    ),
                    ListTile(
                      leading: Icon(Icons.timeline),
                      title: Text('Timeline'),
                      selected: selectedIndex == 2,
                      onTap: () => setState(() => selectedIndex = 2),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'WORK',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Projects'),
                      selected: selectedIndex == 3,
                      onTap: () => setState(() => selectedIndex = 3),
                    ),
                    ListTile(
                      leading: Icon(Icons.science),
                      title: Text('Lab'),
                      selected: selectedIndex == 4,
                      onTap: () => setState(() => selectedIndex = 4),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  "Hello",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text('Dashboard'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Overview'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.timeline),
                    label: Text('Timeline'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.code),
                    label: Text('Projects'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.science),
                    label: Text('Lab'),
                  ),
                ],
                selectedIndex: 0,
              )*/

import 'package:bmogul/providers/theme_provide.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.lastBuild,
    required this.activeProjects,
    required this.themeProvider,
    this.expanded = true,
    required this.onMenuToggle,
  });

  final int lastBuild;
  final int activeProjects;
  final ThemeProvider themeProvider;
  final bool expanded;
  final VoidCallback onMenuToggle;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          IconButton(
            onPressed: () {
              print('Menu');
              onMenuToggle();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      title: Row(
        children: [
          Icon(Icons.terminal),
          Expanded(child: Text('Control_Center')),
        ],
      ),
      actions: [
        if (expanded)
          Row(
            children: [
              Text('System Active'),
              SizedBox(width: 15),
              Text('Last Updated: ${lastBuild}h ago'),
              SizedBox(width: 15),
              Text('Active Projects: ${activeProjects}'),
            ],
          ),

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
    );
  }
}

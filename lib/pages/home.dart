import 'package:bmogul/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:bmogul/providers/github.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GitHubProvider>().loadGitHubData();
      context.read<GitHubProvider>().loadRepositories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final githubProvider = context.watch<GitHubProvider>();
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
                    DashboardMenuItem(
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 0),
                      theme: theme,
                      index: 0,
                      icon: Icons.dashboard,
                      title: 'Dashboard',
                    ),
                    DashboardMenuItem(
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 1),
                      theme: theme,
                      index: 1,
                      icon: Icons.person,
                      title: 'Overview',
                    ),
                    DashboardMenuItem(
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 2),
                      theme: theme,
                      index: 2,
                      icon: Icons.timeline,
                      title: 'Timeline',
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
                    DashboardMenuItem(
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 3),
                      theme: theme,
                      index: 3,
                      icon: Icons.code,
                      title: 'Projects',
                    ),
                    DashboardMenuItem(
                      selectedIndex: selectedIndex,
                      onTap: () => setState(() => selectedIndex = 4),
                      theme: theme,
                      index: 4,
                      icon: Icons.science,
                      title: 'Labs',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Hello",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(githubProvider.userData.toString()),
                          Text(githubProvider.repos.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashboardMenuItem extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback onTap;
  final ThemeData theme;
  final int index;
  final IconData icon;
  final String title;

  const DashboardMenuItem({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.theme,
    required this.index,
    required this.icon,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? theme.colorScheme.primary.withValues(alpha: 0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: selectedIndex == index
            ? Border(
                left: BorderSide(color: theme.colorScheme.primary, width: 3),
              )
            : null,
      ),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              child: selectedIndex == index
                  ? Text(
                      '>',
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    )
                  : null,
            ),
            Icon(icon),
          ],
        ),
        title: Text(title),
        selected: selectedIndex == index,
        onTap: onTap,
      ),
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

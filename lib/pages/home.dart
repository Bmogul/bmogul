import 'package:bmogul/providers/theme_provide.dart';
import 'package:bmogul/widgets/home/comingsoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:bmogul/providers/github.dart';
import 'package:bmogul/widgets/home_app_bar.dart';
import 'package:bmogul/widgets/sidebar.dart';
import 'package:bmogul/widgets/home/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

enum page { DASHBOARD, OVERVIEW, TIMELINE, PROJECTS, LABS }

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  var hiddenMenu = false;
  var _hasShownBanner = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GitHubProvider>().loadGitHubData();
      context.read<GitHubProvider>().loadRepositories();
    });
  }

  void _showConstructionBanner(BuildContext context) {
    if (!_hasShownBanner) {
      _hasShownBanner = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.construction),
                SizedBox(width: 10),
                Text(' Site Under Construction'),
              ],
            ),
            backgroundColor: Colors.orange.shade800,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final githubProvider = context.watch<GitHubProvider>();
    final theme = Theme.of(context);
    Widget page;
    var workingDir = "home";

    var lastBuild = 3;
    var activeProjects = 4;

    switch (selectedIndex) {
      case 0:
        page = Dashboard();
        workingDir = "/home/dashboard";
        break;
      case 1:
        page = ComingSoon();
        workingDir = "/home/overview";
        break;
      case 2:
        page = ComingSoon();
        workingDir = "/home/timeline";
        break;
      case 3:
        page = ComingSoon();
        workingDir = "/home/work/projects";
        break;
      case 4:
        page = ComingSoon();
        workingDir = "/home/work/labs";
        break;
      default:
        page = ComingSoon();
        workingDir = "/home/comingSoon";
        break;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SelectionArea(
          child: Scaffold(
            appBar: HomeAppBar(
              lastBuild: lastBuild,
              activeProjects: activeProjects,
              themeProvider: themeProvider,
              expanded: constraints.maxWidth >= 650,
              onMenuToggle: () => setState(() => hiddenMenu = !hiddenMenu),
            ),
            body: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: hiddenMenu
                      ? 0
                      : (constraints.maxWidth >= 600 ? 180 : 72),
                  child: hiddenMenu
                      ? SizedBox.shrink()
                      : ClipRect(
                          child: SideBar(
                            theme: theme,
                            selectedIndex: selectedIndex,
                            onItemSelected: (index) {
                              setState(() => selectedIndex = index);
                            },
                            extended: constraints.maxWidth >= 600,
                          ),
                        ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: workingDir.substring(
                                  0,
                                  workingDir.lastIndexOf('/') + 1,
                                ),
                                style: theme.textTheme.labelMedium!.copyWith(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                              TextSpan(
                                text: workingDir.substring(
                                  workingDir.lastIndexOf('/') + 1,
                                ),
                                style: theme.textTheme.labelMedium!.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: ListView(children: [page])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

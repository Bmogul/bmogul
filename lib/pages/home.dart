import 'package:bmogul/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:bmogul/providers/github.dart';
import 'package:bmogul/widgets/home_app_bar.dart';
import 'package:bmogul/widgets/sidebar.dart';

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

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: HomeAppBar(
            lastBuild: lastBuild,
            activeProjects: activeProjects,
            themeProvider: themeProvider,
            expanded: constraints.maxWidth >= 650,
          ),
          body: Row(
            children: [
              SideBar(
                theme: theme,
                selectedIndex: selectedIndex,
                onItemSelected: (index) {
                  setState(() => selectedIndex = index);
                },
                extended: constraints.maxWidth >= 600,
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

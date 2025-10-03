import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  List<List<String>> systemInfoContent = [
    ['Role', 'SWE'],
    ['Specialization', 'TBD'],
    ['Experience', '8+ years'],
    ['Status', '...'],
  ];

  List<List<String>> currentFocusContent = [
    ['Primary Stack', 'Flutter, .Net, Firebase'],
    ['Learning', '...'],
  ];

  List<List<String>> gitHubActivityContent = [
    ['Last Push', '??'],
    ['Streak', '?'],
    ['Pull Requests', '???'],
    ['Issues Closed', '?!'],
  ];

  List<List<String>> quickLinksContent = [
    ['GitHub', 'bmogul'],
    ['LinkedIn', '/in/bmogul'],
    ['Email', 'b.mogul02@gmail.com'],
    ['Portfolio', 'bmogul.net'],
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Command Dashboard",
                        style: theme.textTheme.displaySmall!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Real-time system overview and metrics",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GitHubStats(
                theme: theme,
                value: "39",
                title: "Repositories",
                currentUpdates: "+2 this month",
              ),
              SizedBox(width: 25),
              GitHubStats(
                theme: theme,
                value: "100",
                title: "Commits",
                currentUpdates: "+12 this month",
              ),
              SizedBox(width: 25),
              GitHubStats(
                theme: theme,
                value: "12",
                title: "Active Projects",
                currentUpdates: "2 deployed",
              ),
            ],
          ),
          SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              children: [
                InfoCard(
                  theme: theme,
                  title: "System Information",
                  icon: Icons.computer,
                  contentList: systemInfoContent,
                ),
                SizedBox(width: 10),
                InfoCard(
                  theme: theme,
                  title: "Current Focus",
                  icon: Icons.computer,
                  contentList: currentFocusContent,
                ),
              ],
            ),
          ),

          SizedBox(height: 5),
          Row(
            children: [
              InfoCard(
                theme: theme,
                title: "GitHub Activity",
                icon: Icons.local_activity,
                contentList: gitHubActivityContent,
              ),

              SizedBox(width: 10),
              InfoCard(
                theme: theme,
                title: "Quick Links",
                icon: Icons.link,
                contentList: quickLinksContent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.theme,
    required this.title,
    required this.icon,
    required this.contentList,
  });

  final ThemeData theme;
  final List<List<String>> contentList;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: 1, color: theme.colorScheme.outline),
        ),
        color: theme.colorScheme.surface,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Icon(icon, color: theme.colorScheme.tertiary),
                ],
              ),
              SizedBox(height: 20),
              for (var content in contentList)
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          content[0],
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          content[1],
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class GitHubStats extends StatelessWidget {
  const GitHubStats({
    super.key,
    required this.theme,
    required this.value,
    required this.title,
    required this.currentUpdates,
  });

  final ThemeData theme;
  final String value;
  final String title;
  final String currentUpdates;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: 1, color: theme.colorScheme.outline),
        ),
        color: theme.colorScheme.surface,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Text(
                value,
                style: theme.textTheme.displaySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                title,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
              Text(
                currentUpdates,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

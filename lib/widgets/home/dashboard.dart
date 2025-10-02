import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: implement build
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
                      bottom: BorderSide(color: Colors.grey, width: 1),
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
          Row(
            children: [
              GitHubStats(
                theme: theme,
                value: "39",
                title: "Repositories",
                currentUpdates: "+2 this month",
              ),
              GitHubStats(
                theme: theme,
                value: "100",
                title: "Commits",
                currentUpdates: "+12 this month",
              ),
              GitHubStats(
                theme: theme,
                value: "12",
                title: "Active Projects",
                currentUpdates: "2 deployed",
              ),
            ],
          ),
          Row(children: [Card(), Card()]),
          Row(children: [Card(), Card()]),
        ],
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
    return Card(
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
    );
  }
}

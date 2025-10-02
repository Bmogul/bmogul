import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.theme,
    required this.selectedIndex,
    required this.onItemSelected,
    this.extended = true,
  });

  final ThemeData theme;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: extended ? 180 : 72,
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
            onTap: () => onItemSelected(0),
            theme: theme,
            index: 0,
            icon: Icons.dashboard,
            title: 'Dashboard',
            extended: extended,
          ),
          DashboardMenuItem(
            selectedIndex: selectedIndex,
            onTap: () => onItemSelected(1),
            theme: theme,
            index: 1,
            icon: Icons.person,
            title: 'Overview',
            extended: extended,
          ),
          DashboardMenuItem(
            selectedIndex: selectedIndex,
            onTap: () => onItemSelected(2),
            theme: theme,
            index: 2,
            icon: Icons.timeline,
            title: 'Timeline',
            extended: extended,
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
            onTap: () => onItemSelected(3),
            theme: theme,
            index: 3,
            icon: Icons.code,
            title: 'Projects',
            extended: extended,
          ),
          DashboardMenuItem(
            selectedIndex: selectedIndex,
            onTap: () => onItemSelected(4),
            theme: theme,
            index: 4,
            icon: Icons.science,
            title: 'Labs',
            extended: extended,
          ),
        ],
      ),
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
  final bool extended;

  const DashboardMenuItem({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.theme,
    required this.index,
    required this.icon,
    required this.title,
    required this.extended,
  });
  @override
  Widget build(BuildContext context) {
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
        contentPadding: extended
            ? EdgeInsets.symmetric(horizontal: 16)
            : EdgeInsets.fromLTRB(10 , 0, 0, 0),
        leading: extended
            ? Row(
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
              )
            : Icon(icon),
        title: extended ? Text(title) : null,
        selected: selectedIndex == index,
        onTap: onTap,
      ),
    );
  }
}

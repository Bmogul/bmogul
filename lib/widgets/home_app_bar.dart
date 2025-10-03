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
    final theme = Theme.of(context);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BlinkingDot(),
                  SizedBox(width: 4),
                  Text('System Active'),
                ],
              ),
              SizedBox(width: 15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Last Updated:'),
                    TextSpan(
                      text: '${lastBuild}h ago',
                      style: theme.appBarTheme.toolbarTextStyle!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
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

class BlinkingDot extends StatefulWidget {
  const BlinkingDot({super.key, this.color = Colors.green});

  final Color color;

  @override
  State<BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // loop fade in/out
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }
}

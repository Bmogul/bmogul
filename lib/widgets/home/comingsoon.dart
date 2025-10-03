import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: 1, color: theme.colorScheme.outline),
        ),
        color: theme.colorScheme.surface,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.hourglass_empty,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              SizedBox(height: 20),
              Text(
                "Coming Soon",
                style: theme.textTheme.displaySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "This section is under construction",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



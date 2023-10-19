import 'package:flutter/material.dart';

class SettingSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingSectionWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.textTheme.titleMedium?.color?.withOpacity(0.5),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 24, left: 12, right: 12, bottom: 16),
          child: child,
        ),
      ],
    );
  }
}

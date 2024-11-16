import 'package:flutter/material.dart';

class WalkthroughItem extends StatelessWidget {
  const WalkthroughItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });
  final IconData icon;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Icon(
          icon,
          size: 64,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: textTheme.headlineLarge?.copyWith(color: colorScheme.primary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
        ),
      ],
    );
  }
}

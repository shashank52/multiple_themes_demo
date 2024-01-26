import 'package:flutter/material.dart';

/// The `AppTypography` class in Dart is a widget that displays various text styles defined in the
/// current theme.
class AppTypography extends StatelessWidget {
  const AppTypography({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Display Large',
              style: theme.textTheme.displayLarge,
            ),
            Text(
              'Display Medium',
              style: theme.textTheme.displayMedium,
            ),
            Text(
              'Display Small',
              style: theme.textTheme.displaySmall,
            ),
            Text(
              'Headline Large',
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              'Headline Medium',
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              'Headline Small',
              style: theme.textTheme.headlineSmall,
            ),
            Text(
              'Title Large',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              'Title Medium',
              style: theme.textTheme.titleMedium,
            ),
            Text(
              'Title Small',
              style: theme.textTheme.titleSmall,
            ),
            Text(
              'Body Large',
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              'Body Medium',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              'Body Small',
              style: theme.textTheme.bodySmall,
            ),
            Text(
              'Label Large',
              style: theme.textTheme.labelLarge,
            ),
            Text(
              'Label Medium',
              style: theme.textTheme.labelMedium,
            ),
            Text(
              'Label Small',
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

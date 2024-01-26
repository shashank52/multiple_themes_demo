import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/widgets/multiple_choice.dart';
import 'package:multiple_themes_demo/widgets/single_choice.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Common Buttons',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const CommonButtonTypes(enabled: true),
            const CommonButtonTypes(enabled: false),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Icon Buttons',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const IconButtonTypes(enabled: true),
            const IconButtonTypes(enabled: false),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Segmented Buttons',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SegmentedButtonTypes(),
          ],
        ),
      ]),
    );
  }
}

class CommonButtonTypes extends StatelessWidget {
  const CommonButtonTypes({super.key, required this.enabled});
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        runSpacing: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: onPressed, child: const Text('Elevated')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                FilledButton(onPressed: onPressed, child: const Text('Filled')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.tonal(
                onPressed: onPressed, child: const Text('Filled Tonal')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: onPressed, child: const Text('Outlined')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: onPressed, child: const Text('Text')),
          ),
        ],
      ),
    );
  }
}

class IconButtonTypes extends StatelessWidget {
  const IconButtonTypes({super.key, required this.enabled});
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        runSpacing: 2,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: const Icon(Icons.add), onPressed: onPressed)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton.filled(
                onPressed: onPressed, icon: const Icon(Icons.add)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton.filledTonal(
                onPressed: onPressed, icon: const Icon(Icons.add)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton.outlined(
                onPressed: onPressed, icon: const Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}

class SegmentedButtonTypes extends StatelessWidget {
  const SegmentedButtonTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [Text('Single choice'), SingleChoice()]),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Multiple Choice'),
              MultipleChoice(),
            ],
          ),
        )
      ],
    );
  }
}

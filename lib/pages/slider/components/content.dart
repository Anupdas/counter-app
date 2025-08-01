import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key, this.value = 0.5});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Slider Value',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            '${(value * 100).round()}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}

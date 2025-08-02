import 'package:counter_app/pages/slider/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftContentView extends StatelessWidget {
  const LeftContentView({super.key, this.value = 0.5});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Left',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Selector<SliderState, SliderState>(
            shouldRebuild: (previous, next) => next.isLeft,
            selector: (context, state) => state,
            builder: (context, state, _) => Text(
              '${(state.sliderValue * 100).round()}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}

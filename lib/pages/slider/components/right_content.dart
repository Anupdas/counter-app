import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class RightContentView extends StatelessWidget {
  const RightContentView({super.key, this.value = 0.5});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Right',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Consumer<SliderState>(
                //shouldRebuild: (previous, next) => next.isRight,
                //selector: (context, state) => state,
                builder: (context, state, _) {
                  return Text(
                    '${(state.sliderValue * 100).round()}',
                    style: Theme.of(context).textTheme.displayLarge,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state.dart';

typedef SliderValueChanged = void Function(double);

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderState>(
      builder: (context, state, _) {
        return Slider(
          value: state.sliderValue,
          onChanged: (value) {
            context.read<SliderState>().setSliderValue(value);
          },
        );
      },
    );
  }
}

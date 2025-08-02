import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state.dart';

typedef SliderValueChanged = void Function(double);

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SliderState, double>(
      selector: (context, state) => state.sliderValue,
      builder: (context, sliderValue, _) {
        return Slider(
          value: sliderValue,
          onChanged: (value) {
            context.read<SliderState>().setSliderValue(value);
          },
        );
      },
    );
  }
}

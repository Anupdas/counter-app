import 'package:counter_app/pages/slider/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef SliderValueChanged = void Function(double);

class SliderView extends StatelessWidget {
  const SliderView({super.key, this.onChanged});

  final SliderValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: context.watch<SliderState>().sliderValue,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
        context.read<SliderState>().setSliderValue(value);
      },
    );
  }
}

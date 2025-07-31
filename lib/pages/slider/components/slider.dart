import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

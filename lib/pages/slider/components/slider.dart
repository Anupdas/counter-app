import 'package:counter_app/pages/slider/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => Slider(
        value: state.value,
        onChanged: (value) {
          context.read<SliderBloc>().add(SliderValueChanged(value: value));
        },
      ),
    );
  }
}

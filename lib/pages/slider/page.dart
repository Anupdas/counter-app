import 'package:counter_app/pages/slider/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/content.dart';
import 'components/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ContentView(),
              SizedBox(height: 64),
              SliderView(),
            ],
          ),
        ),
      ),
    );
  }
}

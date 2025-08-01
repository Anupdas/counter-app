import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/content.dart';
import 'components/slider.dart';

class SliderState with ChangeNotifier {
  double _sliderValue = 0.0;

  double get sliderValue => _sliderValue;

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void reset() {
    _sliderValue = 0.5;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderState(),
      child: Builder(
        builder: (context) {
          return Scaffold(
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<SliderState>().reset();
              },
              child: Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}

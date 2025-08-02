import 'package:counter_app/pages/slider/components/right_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/left_content.dart';
import 'components/slider.dart';

class SliderState with ChangeNotifier {
  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void reset() {
    _isLeft = false;
    setSliderValue(0.5);
  }

  bool _isLeft = false;
  bool get isLeft => _isLeft;
  bool get isRight => !_isLeft;
  void setLeftSelected(bool value) {
    _isLeft = value;
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
                  CupertinoSlidingSegmentedControl<String>(
                    groupValue: 'Left',
                    onValueChanged: (value) {
                      context.read<SliderState>().setLeftSelected(
                        (value ?? '') == 'Left',
                      );
                    },
                    children: {
                      'Left': Text('Left'),
                      'Right': Text('Right'),
                    },
                  ),

                  SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LeftContentView(),
                      RightContentView(),
                    ],
                  ),
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

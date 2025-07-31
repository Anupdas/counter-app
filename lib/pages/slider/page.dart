import 'package:flutter/material.dart';

import 'components/content.dart';
import 'components/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContentView(value: _value),
            SliderView(
              onChanged: (value) {
                setState(() {
                  _value = value * 100;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/content.dart';
import 'components/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContentView(value: 0.5),
            SliderView(),
          ],
        ),
      ),
    );
  }
}

import 'package:counter_app/pages/slider/components/right_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/left_content.dart';
import 'components/segment.dart';
import 'components/slider.dart';
import 'state.dart';

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
                  SegmentedControl(),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LeftContentView(),
                      RightContentView(),
                    ],
                  ),
                  SizedBox(height: 32),
                  SliderView(),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<SliderState>().reset(),
              child: Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}

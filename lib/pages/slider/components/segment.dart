import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class SegmentedControl extends StatelessWidget {
  const SegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderState>(
      builder: (_, state, _) {
        return CupertinoSlidingSegmentedControl<String>(
          groupValue: state.isLeft ? 'Left' : 'Right',
          onValueChanged: (value) {
            context.read<SliderState>().setLeftSelected(
              (value ?? '') == 'Left',
            );
          },
          children: {
            'Left': Text('Left'),
            'Right': Text('Right'),
          },
        );
      },
    );
  }
}

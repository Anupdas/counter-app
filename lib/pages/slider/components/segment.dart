import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class SegmentedControl extends StatelessWidget {
  const SegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SliderState, String>(
      selector: (context, state) => state.groupValue,
      builder: (_, groupValue, _) {
        return CupertinoSlidingSegmentedControl<String>(
          groupValue: groupValue,
          onValueChanged: (value) {
            context.read<SliderState>().setGroupValue(
              value ?? 'Left',
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

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class SliderControl extends StatelessWidget {
  const SliderControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderState>(
      builder: (_, state, _) => CupertinoSlidingSegmentedControl<String>(
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
      ),
    );
  }
}

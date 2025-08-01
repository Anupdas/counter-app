import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderState(value: 0.5));

  void setSliderValue(double value) {
    emit(SliderState(value: value));
  }
}

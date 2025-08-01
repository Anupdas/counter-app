import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SliderValueChanged>((event, emit) {
      emit(SliderState(value: event.value));
    });
  }
}

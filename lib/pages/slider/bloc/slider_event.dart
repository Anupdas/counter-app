part of 'slider_bloc.dart';

sealed class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderValueChanged extends SliderEvent {
  final double value;

  const SliderValueChanged({required this.value});
}

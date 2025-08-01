part of 'slider_cubit.dart';

class SliderState with EquatableMixin {
  SliderState({this.value = 0.0});

  final double value;

  @override
  List<Object?> get props => [value];
}

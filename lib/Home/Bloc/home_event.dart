import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadApiEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SayHiEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

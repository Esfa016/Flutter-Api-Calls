import 'package:bloc_with_api/Home/Model/BoredActivity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  BoredActivity boredActivity;
  HomeLoadedState({required this.boredActivity});
  @override
  // TODO: implement props
  List<Object?> get props => [boredActivity];
}

class ErrorState extends HomeState {
  @override
  String error;
  ErrorState(this.error);
  // TODO: implement props
  List<Object?> get props => [error];
}

class SayHiState extends HomeState {
  String msg;
  SayHiState(this.msg);
  List<Object?> get props => [msg];
}

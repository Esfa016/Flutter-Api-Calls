import 'package:bloc_with_api/Home/Bloc/home_event.dart';
import 'package:bloc_with_api/Home/Bloc/home_state.dart';
import 'package:bloc_with_api/Home/Repository/BoredActivityRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   ActivityRepository repository;

//   HomeBloc(this.repository) : super(HomeLoadingState()) {
//     on<LoadApiEvent>(event, emit) async {
//       try {
//         final activity = repository.getActivities();
//         emit(HomeLoadedState(boredActivity: activity));
//       } catch (e) {
//         emit(ErrorState(e.toString()));
//       }
//     }
//   }
// }
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ActivityRepository repository;
  HomeBloc(this.repository) : super(HomeLoadingState()) {
    on<LoadApiEvent>(
      (event, emit) async {
        try {
          final activity = await repository.getActivities();
          emit(HomeLoadedState(boredActivity: activity));
          print('this event is triggered');
        } catch (e) {
          print('this is not');
          emit(ErrorState(e.toString()));
        }
      },
    );

    on<SayHiEvent>(((event, emit) {
      emit(SayHiState('hello you have masterd bloc'));
    }));
  }
}

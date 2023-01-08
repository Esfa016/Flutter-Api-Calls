import 'package:bloc_with_api/Home/Bloc/home_event.dart';
import 'package:bloc_with_api/Home/Bloc/home_state.dart';
import 'package:bloc_with_api/Home/Repository/BoredActivityRepository.dart';
import 'package:bloc_with_api/Home/Repository/exceptions.dart';
import 'package:dio/dio.dart';
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
        } on DioError catch (e) {
          print(e.type.name);
          if (e.type == DioErrorType.connectTimeout)
            emit(ErrorState('no connection'));
          else if (e.type == DioErrorType.other) {
            emit(ErrorState('something went wrong! try again'));
          }
        }
      },
    );

    on<SayHiEvent>(((event, emit) {
      emit(SayHiState('hello you have masterd bloc'));
    }));
  }
}

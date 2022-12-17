import 'package:bloc_with_api/Home/Bloc/home_bloc.dart';
import 'package:bloc_with_api/Home/Bloc/home_event.dart';
import 'package:bloc_with_api/Home/Bloc/home_state.dart';
import 'package:bloc_with_api/Home/Repository/BoredActivityRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(
              RepositoryProvider.of<ActivityRepository>(context),
            )..add(LoadApiEvent()),
        child: Scaffold(
          floatingActionButton: _elevatedButton(),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return CircularProgressIndicator();
              } else if (state is HomeLoadedState) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.boredActivity.activity),
                      Text(state.boredActivity.key),
                      Text(state.boredActivity.type),
                    ],
                  ),
                );
              } else if (state is ErrorState) {
                return Text(state.error);
              } else if (state is SayHiState) {
                return Text(state.msg);
              }
              return Container();
            },
          ),
        ));
  }
}

class _elevatedButton extends StatelessWidget {
  const _elevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)..add(LoadApiEvent());
            },
            child: Text('get back')),
        ElevatedButton(
          child: Text('say hi'),
          onPressed: () {
            BlocProvider.of<HomeBloc>(context)..add(SayHiEvent());
          },
        ),
      ],
    );
  }
}

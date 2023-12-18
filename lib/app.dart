import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc/launch_list_bloc.dart';
import 'package:flutter_counter/models/launchpad/bloc/launchpad_bloc.dart';
import 'package:flutter_counter/repositoey/spacex_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchApp extends StatelessWidget {
  const LaunchApp({super.key});

  @override
  Widget build(BuildContext context) {
    final launchRepository =
        LaunchRepositoryImpl(); // Initialize LaunchRepository
    // final launchListBloc =
    //     BlocProvider(create: (context) => LaunchListBloc(launchRepository));
    final launchListBloc = LaunchListBloc(launchRepository);
    final launchpadBloc =
        BlocProvider<LaunchpadBloc>(create: (context) => LaunchpadBloc());

    return MultiBlocProvider(
        providers: [launchpadBloc],
        // child: MaterialApp.router(
        //   routerConfig: Modular.routerConfig,
        // ),
        child: MaterialApp(
          home: BlocProvider<LaunchListBloc>(
            create: (context) => launchListBloc,
            child: MaterialApp.router(
              routerConfig: Modular.routerConfig,
            ),
          ),
        ));
  }
}

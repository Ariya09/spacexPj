import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc/launch_list_bloc.dart';
import 'package:flutter_counter/repositoey/spacex_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchApp extends StatelessWidget {
  const LaunchApp({super.key});

  @override
  Widget build(BuildContext context) {
    final launchRepository =
        LaunchRepositoryImpl(); // Initialize LaunchRepository
    final launchListBloc = LaunchListBloc(launchRepository);

    return MaterialApp(
      home: BlocProvider<LaunchListBloc>(
        create: (context) => launchListBloc,
        child: MaterialApp.router(
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc/launch_list_bloc.dart';
import 'package:flutter_counter/repositoey/spacex_repository.dart';
import 'package:flutter_counter/view/launch_list_ui.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final launchRepository =
        LaunchRepositoryImpl(); // Initialize LaunchRepository
    final launchListBloc = LaunchListBloc(launchRepository);

    return MaterialApp(
      initialRoute: '/',
      // navigatorKey: Modular.navigatorKey,
      // onGenerateRoute: Modular.generateRoute,
      home: BlocProvider<LaunchListBloc>(
        create: (context) => launchListBloc,
        child: LaunchListScreen(),
      ),
    );
  }
}

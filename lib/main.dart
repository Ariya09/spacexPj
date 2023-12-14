import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/launch_observer.dart';
import 'package:flutter_counter/route.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Bloc.observer = const LaunchObserver();
  return runApp(ModularApp(module: AppModule(), child: CounterApp()));
}

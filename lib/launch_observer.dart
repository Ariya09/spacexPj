import 'package:bloc/bloc.dart';

class LaunchObserver extends BlocObserver {
  /// {@macro counter_observer}
  const LaunchObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change ewe');
  }
}

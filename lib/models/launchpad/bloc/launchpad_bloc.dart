import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launchpad_event.dart';
part 'launchpad_state.dart';

class LaunchpadBloc extends Bloc<LaunchpadEvent, LaunchpadState> {
  LaunchpadBloc() : super(LaunchpadState(launchpad_id: '')) {
    on<setLaunchpadIDEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(launchpad_id: event.launchpad_id));
    });
  }
}

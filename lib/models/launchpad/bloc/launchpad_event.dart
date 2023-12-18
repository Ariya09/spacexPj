part of 'launchpad_bloc.dart';

sealed class LaunchpadEvent extends Equatable {
  const LaunchpadEvent();

  @override
  List<Object> get props => [];
}

class setLaunchpadIDEvent extends LaunchpadEvent {
  final String launchpad_id;

  const setLaunchpadIDEvent({required this.launchpad_id});
}

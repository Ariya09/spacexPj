part of 'launchpad_bloc.dart';

class LaunchpadState extends Equatable {
  final String launchpad_id;

  const LaunchpadState({required this.launchpad_id});

  LaunchpadState copyWith({required String launchpad_id}) {
    return LaunchpadState(launchpad_id: launchpad_id);
  }

  @override
  List<Object> get props => [launchpad_id];
}

final class LaunchpadInitial extends LaunchpadState {
  LaunchpadInitial({required super.launchpad_id});

  // LaunchpadState copyWith(String? launchpad_id) {
  //   return LaunchpadState(launchpad_id: launchpad_id ?? this.launchpad_id);
  // }
}

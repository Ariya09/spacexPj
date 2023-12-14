part of 'launch_list_bloc.dart';

@immutable
abstract class LaunchListState {}

class InitialLaunchListState extends LaunchListState {}

class LoadingLaunchListState extends LaunchListState {}

class SuccessLaunchListState extends LaunchListState {
  final List<SpacexLatest> launches;

  SuccessLaunchListState(this.launches);
}

class ErrorLaunchListState extends LaunchListState {
  final String error;

  ErrorLaunchListState(this.error);
}

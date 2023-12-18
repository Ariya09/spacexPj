part of 'launch_list_bloc.dart';

sealed class LaunchListEvent extends Equatable {
  const LaunchListEvent();

  @override
  List<Object> get props => [];
}

@immutable
// abstract class LaunchListEvent {}

class FetchLaunchesEvent extends LaunchListEvent {}

class SearchLaunchEvent extends LaunchListEvent {
  final String query;

  SearchLaunchEvent(this.query);
}

class SortLaunchesEvent extends LaunchListEvent {
  final LaunchSortOption sortOption;

  SortLaunchesEvent(this.sortOption);
}

// class LaunchDetailEvent extends LaunchListEvent {
//   final LaunchListBloc launch;

//   const LaunchDetailEvent({required this.launch});

//   @override
//   List<Object> get props => [launch];
// }
class LaunchDetailEvent extends LaunchListEvent {
  final String launch;

  const LaunchDetailEvent({required this.launch});

  @override
  List<Object> get props => [launch];
}

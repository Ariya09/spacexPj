part of 'launch_list_bloc.dart';

sealed class LaunchListEvent extends Equatable {
  const LaunchListEvent();

  @override
  List<Object> get props => [];
}

// class FetchLaunchesEvent extends LaunchListEvent {
//   final String? query;
//   FetchLaunchesEvent({this.query});
// }

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

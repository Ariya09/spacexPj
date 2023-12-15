import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/repositoey/option.dart';
import 'package:flutter_counter/repositoey/spacex_repository.dart';

import '../models/spacex_past/spacex_latest.dart';

part 'launch_list_event.dart';
part 'launch_list_state.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  final LaunchRepository _repository;

  LaunchListBloc(this._repository) : super(InitialLaunchListState()) {
    on<FetchLaunchesEvent>((event, emit) async {
      emit(LoadingLaunchListState());
      try {
        final launches = await _repository.fetchLaunches();
        emit(SuccessLaunchListState(launches));
      } catch (error) {
        emit(ErrorLaunchListState(error.toString()));
      }
    });

    on<SearchLaunchEvent>((event, emit) async {
      final launches = await _repository.fetchLaunches();
      final filteredLaunches = launches
          .where((launch) =>
              launch.name!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(SuccessLaunchListState(filteredLaunches));
    });

    on<SortLaunchesEvent>((event, emit) async {
      final launches = await _repository.fetchLaunches();
      if (event.sortOption == LaunchSortOption.name) {
        launches.sort((a, b) => a.name!.compareTo(b.name!));
      } else if (event.sortOption == LaunchSortOption.launchTime) {
        launches.sort((a, b) => a.dateUtc!.compareTo(b.dateUtc!));
      }
      emit(SuccessLaunchListState(launches));
    });
  }
}

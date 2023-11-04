import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc({
    required LocalKeyValueDataSource datasource
  }) : _localKeyValueDataSource = datasource, super(const LaunchState()) {
    on<LaunchStartEvent>(_start);
    on<LaunchEndedEvent>(_ended);
  }

  final LocalKeyValueDataSource _localKeyValueDataSource;

  Future<void> _start(
      LaunchStartEvent event,
      Emitter<LaunchState> emit
  ) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    String? accessToken = await _localKeyValueDataSource.accessToken;

    emit(state.copyWith(
        loadingStatus: accessToken == null ?
        LoadingStatus.failure :
        LoadingStatus.success
    ));
  }

  Future<void> _ended(
      LaunchEndedEvent event,
      Emitter<LaunchState> emit
      ) async {
  }
}

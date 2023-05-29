
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppChangeStatus>(_onChangeStatus);
  }

  Future<void> _onChangeStatus(
    AppChangeStatus event,
    Emitter<AppState> emit
  ) async {
    logger.d('Change Status ${event.appStaus}');
    emit(state.copyWith(status: event.appStaus));
  }
}
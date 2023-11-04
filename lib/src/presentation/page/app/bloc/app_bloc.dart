
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required TestRepository testRepository
  }) : _testRepository = testRepository, super(const AppState())  {
    on<AppChangeStatus>(_onChangeStatus);
  }

  final TestRepository _testRepository;

  Future<void> _onChangeStatus(
    AppChangeStatus event,
    Emitter<AppState> emit
  ) async {
    emit(state.copyWith(status: event.appStaus));
  }
}
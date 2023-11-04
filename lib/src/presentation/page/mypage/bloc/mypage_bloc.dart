import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';

part 'mypage_event.dart';
part 'mypage_state.dart';

class MypageBloc extends Bloc<MypageEvent, MypageState> {
  MypageBloc({
    required LocalKeyValueDataSource dataSource
  }) : _localKeyValueDataSource = dataSource, super(const MypageState()) {
    on<MyPageLogoutEvent>(_logout);
  }

  final LocalKeyValueDataSource _localKeyValueDataSource;

  Future<void> _logout(
    MyPageLogoutEvent event,
    Emitter<MypageState> emit
  ) async {
    await _localKeyValueDataSource.deleteAccessToken();
    await _localKeyValueDataSource.deleteRefreshToken();
  }

}

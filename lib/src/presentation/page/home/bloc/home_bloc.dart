import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

import '../view/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(): super(const HomeState()) {
    on<HomeSelectCategory>(_onPressedCategory);
  }

  Future<void> _onPressedCategory(
    HomeSelectCategory event,
    Emitter<HomeState> emit
  ) async {
    // Server API - 새로운 리스트 받아오기
    List<MockMentoringData> data;

    if (event.selectedHomeCategroyId == 0)
      data = mockData;
    else if (event.selectedHomeCategroyId == 1)
      data = mockData.where((element) => element.category == "멘토링 요청").toList();
    else
      data = mockData.where((element) => element.category == "멘토링 제안").toList();

    logger.d("data 갯수 확인 ${data.length}");

    emit(state.copyWith(
      selectedHomeCategroyId: event.selectedHomeCategroyId,
      list: data)
    );
  }
}
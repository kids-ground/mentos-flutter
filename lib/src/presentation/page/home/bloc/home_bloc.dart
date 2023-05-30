import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    emit(state.copyWith(selectedHomeCategroyId: event.selectedHomeCategroyId));
  }
}
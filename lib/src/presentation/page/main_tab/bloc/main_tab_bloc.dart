import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_tab_event.dart';
part 'main_tab_state.dart';

class MainTabBloc extends Bloc<MainTabEvent, MainTabState> {
  MainTabBloc(): super(const MainTabState()) {
    on<MainTabSelectedItem>(_onChangedSelectedItem);
  }

  Future<void> _onChangedSelectedItem(
    MainTabSelectedItem event,
    Emitter<MainTabState> emit
  ) async {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }
}
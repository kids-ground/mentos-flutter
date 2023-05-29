part of 'main_tab_bloc.dart';

abstract class MainTabEvent extends Equatable {
  const MainTabEvent();

  @override
  List<Object?> get props => [];
}

class MainTabSelectedItem extends MainTabEvent {
  const MainTabSelectedItem({
    required this.selectedIndex
  }): super();

  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];
}
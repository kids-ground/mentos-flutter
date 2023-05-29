part of 'main_tab_bloc.dart';

class MainTabState extends Equatable {
  const MainTabState({
    this.selectedIndex = 0
  });

  final int selectedIndex;

  MainTabState copyWith({
    int? selectedIndex
  }) => MainTabState(
    selectedIndex: selectedIndex ?? this.selectedIndex
  );

  @override
  List<Object?> get props => [selectedIndex];
}
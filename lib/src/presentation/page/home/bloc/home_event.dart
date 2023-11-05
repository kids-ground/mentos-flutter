part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadPostListEvent extends HomeEvent {
  const HomeLoadPostListEvent();
}

class HomeSelectCategory extends HomeEvent {
  const HomeSelectCategory({
    required this.selectedHomeCategroyId
  }): super();

  final int selectedHomeCategroyId;

  @override
  List<Object?> get props => [selectedHomeCategroyId];
}
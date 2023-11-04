part of 'launch_bloc.dart';

abstract class LaunchEvent extends Equatable {
  const LaunchEvent();

  @override
  List<Object> get props => [];
}

class LaunchStartEvent extends LaunchEvent {
  const LaunchStartEvent();
}

class LaunchEndedEvent extends LaunchEvent {
  const LaunchEndedEvent();
}
part of 'launch_bloc.dart';


class LaunchState extends Equatable {
  const LaunchState({
    this.loadingStatus = LoadingStatus.init
  });

  final LoadingStatus loadingStatus;

  LaunchState copyWith({
    LoadingStatus? loadingStatus
  }) => LaunchState(
      loadingStatus: loadingStatus ?? this.loadingStatus
  );

  @override
  List<Object> get props => [loadingStatus];
}

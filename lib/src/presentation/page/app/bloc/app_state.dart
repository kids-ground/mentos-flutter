part of 'app_bloc.dart';


class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.init
  });

  final AppStatus status;

  AppState copyWith({
    AppStatus? status
  }) => AppState(
    status: status ?? this.status
  );

  @override
  List<Object?> get props => [status];
}
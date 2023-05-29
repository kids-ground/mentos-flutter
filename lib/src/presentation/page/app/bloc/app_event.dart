part of 'app_bloc.dart';


abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppChangeStatus extends AppEvent {
  const AppChangeStatus({
    required this.appStaus
  }): super();

  final AppStatus appStaus;

  @override
  List<Object?> get props => [appStaus];
}
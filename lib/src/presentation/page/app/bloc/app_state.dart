part of 'app_bloc.dart';


// App 시작하면 로그인되어 있는 유저인지 확인

enum AppStatus {
  // 초기 확인중
  loading,
  // Not login -> 로그인 창으로
  unAuth,
  // 회원가입완료 -> 메인 화면으로
  joined,
  // 회원가입완료 -> 멘토 인증중
  registering
}

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.loading
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
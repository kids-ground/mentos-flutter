part of 'login_bloc.dart';

enum LoginStatus {
  none,
  failure,
  signUp,
  signIn
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.none
  });

  final LoginStatus status;

  LoginState copyWith({
    LoginStatus? status
  }) => LoginState(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}
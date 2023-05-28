
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPressedKakaoLoginEvent extends LoginEvent {
  const LoginPressedKakaoLoginEvent();
}

class LoginPressedAppleLoginEvent extends LoginEvent {
  const LoginPressedAppleLoginEvent();
}
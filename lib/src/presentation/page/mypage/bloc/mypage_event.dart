part of 'mypage_bloc.dart';

abstract class MypageEvent extends Equatable {
  const MypageEvent();

  @override
  List<Object> get props => [];
}

class MyPageLogoutEvent extends MypageEvent {
  const MyPageLogoutEvent();
}

part of 'profile_modify_bloc.dart';

abstract class ProfileModifyEvent extends Equatable {
  const ProfileModifyEvent();

  @override
  List<Object?> get props => [];
}

class ProfileModifyGetProfile extends ProfileModifyEvent {
  const ProfileModifyGetProfile();
}

class ProfileModifySelectedImage extends ProfileModifyEvent {
  const ProfileModifySelectedImage({
    required this.image
  });

  final File image;
}

class ProfileModifyNickname extends ProfileModifyEvent {
  const ProfileModifyNickname({
    required this.nickname
  });

  final String nickname;
}

class ProfileModifySave extends ProfileModifyEvent {
  const ProfileModifySave();
}
part of 'profile_modify_bloc.dart';

class ProfileModifyState extends Equatable {
  const ProfileModifyState({
    this.memberResponse,
    this.newProfileImageFile,
    this.newNickname,
    this.loadingStatus = LoadingStatus.init
  });

  final MemberResponse? memberResponse;
  final File? newProfileImageFile;
  final String? newNickname;
  final LoadingStatus loadingStatus;

  ProfileModifyState copyWith({
    MemberResponse? memberResponse,
    File? newProfileImageFile,
    String? newNickname,
    LoadingStatus? loadingStatus
  }) => ProfileModifyState(
    memberResponse: memberResponse ?? this.memberResponse,
    newProfileImageFile: newProfileImageFile ?? this.newProfileImageFile,
    newNickname: newNickname ?? this.newNickname,
    loadingStatus: loadingStatus ?? this.loadingStatus
  );

  @override
  List<Object?> get props => [memberResponse, newProfileImageFile, newNickname, loadingStatus];
}

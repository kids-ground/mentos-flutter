part of 'mentor_profile_modify_bloc.dart';


// 멘토정보들
class MentorProfileInfo extends Equatable {
  MentorProfileInfo(
    this.email,
    this.verifyType,
    this.openTalkLink,
    this.jobGroup,
    this.detailJob,
    this.introduction,
    this.description
  );

  String email;
  MentorVerifyType verifyType;
  String openTalkLink;
  JobGroup jobGroup;
  String detailJob;
  String introduction;
  String description;

  @override
  List<Object?> get props => [email, verifyType, openTalkLink, jobGroup, detailJob, introduction, description];
}

class MentorProfileModifyState extends Equatable {
  const MentorProfileModifyState({
    this.basicInfo,
    this.updatedInfo,
    this.isActiveEmailVerify = false,
    this.visibleEmailVerify = false,
    this.isActiveEmailVerifyConfirm = false,
  });

  final MentorProfileInfo? basicInfo;
  final MentorProfileInfo? updatedInfo;

  final bool isActiveEmailVerify;
  final bool visibleEmailVerify;
  final bool isActiveEmailVerifyConfirm;

  MentorProfileModifyState copyWith({
    MentorProfileInfo? basicInfo,
    MentorProfileInfo? updatedInfo,
    bool? isActiveEmailVerify,
    bool? visibleEmailVerify,
    bool? isActiveEmailVerifyConfirm
  }) => MentorProfileModifyState(
    basicInfo: basicInfo ?? this.basicInfo,
    updatedInfo: updatedInfo ?? this.updatedInfo,
    isActiveEmailVerify: isActiveEmailVerify ?? this.isActiveEmailVerify,
    visibleEmailVerify: visibleEmailVerify ?? this.visibleEmailVerify,
    isActiveEmailVerifyConfirm: isActiveEmailVerifyConfirm ?? this.isActiveEmailVerifyConfirm
  );

  @override
  List<Object?> get props => [
    basicInfo,
    updatedInfo,
    isActiveEmailVerify, visibleEmailVerify, isActiveEmailVerifyConfirm
  ];
}
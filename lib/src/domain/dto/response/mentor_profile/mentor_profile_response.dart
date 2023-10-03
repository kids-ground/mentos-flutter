
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class MentorProfileResponse extends Equatable {
  MentorProfileResponse(
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

import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class MentorProfileResponse extends Equatable {
  MentorProfileResponse(
    this.email,
    this.verifyType,
    this.openTalkLink,
    this.jobYear,
    this.jobGroup,
    this.detailJob,
    this.introduction,
    this.description,
    this.mentoringCount,
    this.reviewCount,
    this.reviewRate
  );

  // 개인용
  String email;
  MentorVerifyType verifyType;

  // 공통
  String openTalkLink;
  JobGroup jobGroup;
  JobYear jobYear;
  String detailJob;
  String introduction;
  String description;

  // 공개용
  int mentoringCount;
  int reviewCount;
  double reviewRate;

  @override
  List<Object?> get props => [email, verifyType, openTalkLink, jobYear, jobGroup, detailJob, introduction, description, mentoringCount, reviewCount, reviewRate];
}
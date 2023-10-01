part of 'mentor_profile_modify_bloc.dart';

abstract class MentorProfileModifyEvent extends Equatable {
  const MentorProfileModifyEvent();

  @override
  List<Object?> get props => [];
}

class MentorProfileModifyEmail extends MentorProfileModifyEvent {
  const MentorProfileModifyEmail({required this.email});
  final String email;
}

class MentorProfileModifyEmailVerifyPressed extends MentorProfileModifyEvent {
  const MentorProfileModifyEmailVerifyPressed();
}

class MentorProfileModifyEmailVerify extends MentorProfileModifyEvent {
  const MentorProfileModifyEmailVerify({required this.verifyNumber});
  final String verifyNumber;
}

class MentorProfileModifyEmailVerifyConfirmPressed extends MentorProfileModifyEvent {
  const MentorProfileModifyEmailVerifyConfirmPressed();
}

class MentorProfileModifyOpenChatLink extends MentorProfileModifyEvent {
  const MentorProfileModifyOpenChatLink({required this.link});
  final String link;
}

class MentorProfileModifyJobGroup extends MentorProfileModifyEvent {
  const MentorProfileModifyJobGroup({required this.jobGroup});
  final JobGroup jobGroup;
}

class MentorProfileModifyJobDetail extends MentorProfileModifyEvent {
  const MentorProfileModifyJobDetail({required this.jobDetail});
  final String jobDetail;
}

class MentorProfileModifyIntroduction extends MentorProfileModifyEvent {
  const MentorProfileModifyIntroduction({required this.introduction});
  final String introduction;
}

class MentorProfileModifyDescription extends MentorProfileModifyEvent {
  const MentorProfileModifyDescription({required this.description});
  final String description;
}

class MentorProfileModifySave extends MentorProfileModifyEvent {
  const MentorProfileModifySave();
}
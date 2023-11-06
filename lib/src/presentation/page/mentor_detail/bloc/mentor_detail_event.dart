part of 'mentor_detail_bloc.dart';

abstract class MentorDetailEvent extends Equatable {
  const MentorDetailEvent();

  @override
  List<Object?> get props => [];
}

class MentorDetailLoadMentorProfile extends MentorDetailEvent {
  const MentorDetailLoadMentorProfile({
    required this.mentorId
  });

  final int mentorId;
}

class MentorDetailOpenTalkLink extends MentorDetailEvent {
  const MentorDetailOpenTalkLink();
}

class MentorDetailEventBookmarked extends MentorDetailEvent {
  const MentorDetailEventBookmarked({
    required this.isBookmarked
  });

  final bool isBookmarked;
}
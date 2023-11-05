part of 'mentor_detail_bloc.dart';

class MentorDetailState extends Equatable {
  const MentorDetailState({
    this.isBookmarked = false,
    this.mentorProfileResponse
  });

  final MentorResponse? mentorProfileResponse;
  final bool isBookmarked;

  MentorDetailState copyWith({
    MentorResponse? mentorProfileResponse,
    bool? isBookmarked
  }) => MentorDetailState(
    mentorProfileResponse: mentorProfileResponse ?? this.mentorProfileResponse,
    isBookmarked: isBookmarked ?? this.isBookmarked
  );

  @override
  List<Object?> get props => [mentorProfileResponse, isBookmarked];
}

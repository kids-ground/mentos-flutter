part of 'mentor_detail_bloc.dart';

class MentorDetailState extends Equatable {
  const MentorDetailState({
    this.isBookmarked = false
  });

  final bool isBookmarked;

  MentorDetailState copyWith({
    bool? isBookmarked
  }) => MentorDetailState(
    isBookmarked: isBookmarked ?? this.isBookmarked
  );

  @override
  List<Object> get props => [isBookmarked];
}

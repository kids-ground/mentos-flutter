part of 'mentor_detail_bloc.dart';

abstract class MentorDetailEvent extends Equatable {
  const MentorDetailEvent();

  @override
  List<Object?> get props => [];
}

class MentorDetailEventBookmarked extends MentorDetailEvent {
  const MentorDetailEventBookmarked({
    required this.isBookmarked
  });

  final bool isBookmarked;
}
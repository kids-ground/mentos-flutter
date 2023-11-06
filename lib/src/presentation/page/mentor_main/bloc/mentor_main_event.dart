part of 'mentor_main_bloc.dart';

abstract class MentorMainEvent extends Equatable {
  const MentorMainEvent();

  @override
  List<Object> get props => [];
}

class MentorMainListLoad extends MentorMainEvent {
  const MentorMainListLoad();
}

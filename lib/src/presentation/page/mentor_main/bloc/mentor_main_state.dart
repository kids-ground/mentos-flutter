part of 'mentor_main_bloc.dart';

class MentorMainState extends Equatable {
  const MentorMainState({
    this.list = const <MentorResponse>[]
  });

  final List<MentorResponse> list;

  MentorMainState copyWith({
    List<MentorResponse>? list
  }) => MentorMainState(
    list: list ?? this.list
  );

  @override
  List<Object> get props => [list];
}

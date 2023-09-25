import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'mentor_profile_modify_event.dart';
part 'mentor_profile_modify_state.dart';

class MentorProfileModifyBloc extends Bloc<MentorProfileModifyEvent, MentorProfileModifyState> {
  MentorProfileModifyBloc(): super(const MentorProfileModifyState()) {

  }
}
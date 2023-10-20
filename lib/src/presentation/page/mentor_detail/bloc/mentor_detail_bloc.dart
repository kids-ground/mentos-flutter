import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor_profile/mentor_profile_response.dart';

part 'mentor_detail_event.dart';
part 'mentor_detail_state.dart';

class MentorDetailBloc extends Bloc<MentorDetailEvent, MentorDetailState> {
  MentorDetailBloc() : super(const MentorDetailState()) {
    on<MentorDetailEventBookmarked>(_onPressedBookmark);
  }

  Future<void> _onPressedBookmark(
    MentorDetailEventBookmarked event,
    Emitter<MentorDetailState> emit,
  ) async {
    emit(state.copyWith(isBookmarked: event.isBookmarked));
  }
}

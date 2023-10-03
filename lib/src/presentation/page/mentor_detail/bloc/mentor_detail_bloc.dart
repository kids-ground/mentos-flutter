import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mentor_detail_event.dart';
part 'mentor_detail_state.dart';

class MentorDetailBloc extends Bloc<MentorDetailEvent, MentorDetailState> {
  MentorDetailBloc() : super(const MentorDetailState()) {
    on<MentorDetailEvent>((event, emit) {

    });
  }
}

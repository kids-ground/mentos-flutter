import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mentoring_review_write_event.dart';
part 'mentoring_review_write_state.dart';

class MentoringReviewWriteBloc extends Bloc<MentoringReviewWriteEvent, MentoringReviewWriteState> {
  MentoringReviewWriteBloc() : super(MentoringReviewWriteInitial()) {
    on<MentoringReviewWriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

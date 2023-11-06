import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/request/mentor/mentor_list_request.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_list_response.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';
import 'package:mentos_flutter/src/data/repository/network/mentor_repository.dart';

part 'mentor_main_event.dart';
part 'mentor_main_state.dart';

class MentorMainBloc extends Bloc<MentorMainEvent, MentorMainState> {
  MentorMainBloc({
    required MentorRepository mentorRepository
  }): _mentorRepository = mentorRepository, super(const MentorMainState()) {
    on<MentorMainListLoad>(_loadMentorList);
  }

  final MentorRepository _mentorRepository;

  Future<void> _loadMentorList(
    MentorMainListLoad event,
    Emitter<MentorMainState> emit
  ) async {
    MentorListResponse response = await _mentorRepository.getMentorList(MentorListRequest());
    emit(state.copyWith(list: response.result));
  }
}

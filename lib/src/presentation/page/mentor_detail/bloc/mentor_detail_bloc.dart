import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';
import 'package:mentos_flutter/src/data/repository/network/mentor_repository.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';
import 'package:url_launcher/url_launcher.dart';


part 'mentor_detail_event.dart';
part 'mentor_detail_state.dart';

class MentorDetailBloc extends Bloc<MentorDetailEvent, MentorDetailState> {
  MentorDetailBloc({
    required MentorRepository mentorRepository,
    required LocalKeyValueDataSource localKeyValueDataSource
  }): _mentorRepository = mentorRepository,
        _localKeyValueDataSource = localKeyValueDataSource,
        super(const MentorDetailState()) {
    on<MentorDetailEventBookmarked>(_onPressedBookmark);
    on<MentorDetailOpenTalkLink>(_openTalkLink);
    on<MentorDetailLoadMentorProfile>(_loadMentorProfile);
  }

  final MentorRepository _mentorRepository;
  final LocalKeyValueDataSource _localKeyValueDataSource;

  Future<void> _loadMentorProfile(
      MentorDetailLoadMentorProfile event,
      Emitter<MentorDetailState> emit,
  ) async {
    final response = await _mentorRepository.getMentorProfile(event.mentorId);
    final bookMarkedList = (await _localKeyValueDataSource.bookMarkedMentorList)
      ?.map((e) => int.parse(e))
      .toList() ?? <int>[];

    emit(state.copyWith(mentorProfileResponse: response, isBookmarked: bookMarkedList.contains(event.mentorId)));
  }

  Future<void> _openTalkLink(
      MentorDetailOpenTalkLink event,
      Emitter<MentorDetailState> emit,
  ) async {
    if (state.mentorProfileResponse == null) return;
    final Uri url = Uri.parse(state.mentorProfileResponse!.kakaoChatLink);

    if (!await launchUrl(url)) {
      logger.e('브라우저 열기 실패');
    }
  }

  Future<void> _onPressedBookmark(
    MentorDetailEventBookmarked event,
    Emitter<MentorDetailState> emit,
  ) async {
    if (state.mentorProfileResponse == null) return;
    event.isBookmarked ?
      await _localKeyValueDataSource.addBookMarkedMentor(state.mentorProfileResponse!.mentorId) :
      await _localKeyValueDataSource.deleteBookMarkedMentor(state.mentorProfileResponse!.mentorId);

    emit(state.copyWith(isBookmarked: event.isBookmarked));
  }
}

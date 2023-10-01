import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

part 'mentor_profile_modify_event.dart';
part 'mentor_profile_modify_state.dart';

class MentorProfileModifyBloc extends Bloc<MentorProfileModifyEvent, MentorProfileModifyState> {
  MentorProfileModifyBloc(): super(const MentorProfileModifyState()) {
    on<MentorProfileModifyFetchBasicInfo>(_fetchBasicInfo);
    on<MentorProfileModifyEmail>(_modifyEmail);
    on<MentorProfileModifyEmailVerifyPressed>(_onPressedEmailVerify);
    on<MentorProfileModifyEmailVerify>(_modifyEmailVerify);
    on<MentorProfileModifyEmailVerifyConfirmPressed>(_onPressedEmailVerifyConfirm);
    on<MentorProfileModifyOpenChatLink>(_modifyOpenChatLink);
    on<MentorProfileModifyJobGroup>(_modifyJobGroup);
    on<MentorProfileModifyJobDetail>(_modifyJobDetail);
    on<MentorProfileModifyIntroduction>(_modifyIntroduction);
    on<MentorProfileModifyDescription>(_modifyDescription);
    on<MentorProfileModifySave>(_onPressedSave);
  }

  Future<void> _fetchBasicInfo(
    MentorProfileModifyFetchBasicInfo event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    // 기존 정보 가져오
    // basicInfo, updatedInfo 만들기
  }

  Future<void> _modifyEmail(
    MentorProfileModifyEmail event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    if (!RegExp(emailPattern).hasMatch(event.email)) {
      emit(state.copyWith(isActiveEmailVerify: false));
      return;
    }

    state.updatedInfo?.email = event.email;

    emit(state.copyWith(
      isActiveEmailVerify: true,
    ));
  }

  Future<void> _onPressedEmailVerify(
    MentorProfileModifyEmailVerifyPressed event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    // email 인증 보내기 API
    // +Top SnackBar
    emit(state.copyWith(visibleEmailVerify: true, isActiveEmailVerify: false));
  }

  Future<void> _modifyEmailVerify(
    MentorProfileModifyEmailVerify event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    if (event.verifyNumber.length != 6) {
      emit(state.copyWith(isActiveEmailVerifyConfirm: false));
      return;
    }

    emit(state.copyWith(isActiveEmailVerifyConfirm: true));
  }

  Future<void> _onPressedEmailVerifyConfirm(
    MentorProfileModifyEmailVerifyConfirmPressed event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    // email 인증 확인 API
    // +Top SnackBar
    emit(state.copyWith(isActiveEmailVerifyConfirm: false));
  }

  Future<void> _modifyOpenChatLink(
    MentorProfileModifyOpenChatLink event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    state.updatedInfo?.openTalkLink = event.link;
  }

  Future<void> _modifyJobGroup(
    MentorProfileModifyJobGroup event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    state.updatedInfo?.jobGroup = event.jobGroup;
  }

  Future<void> _modifyJobDetail(
    MentorProfileModifyJobDetail event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    state.updatedInfo?.detailJob = event.jobDetail;
  }

  Future<void> _modifyIntroduction(
    MentorProfileModifyIntroduction event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    state.updatedInfo?.introduction = event.introduction;
  }

  Future<void> _modifyDescription(
    MentorProfileModifyDescription event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    state.updatedInfo?.description = event.description;
  }

  Future<void> _onPressedSave(
    MentorProfileModifySave event,
    Emitter<MentorProfileModifyState> emit
  ) async {
    // API
    // SnackBar 등
  }
}
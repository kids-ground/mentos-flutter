import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

part 'mentor_profile_modify_event.dart';
part 'mentor_profile_modify_state.dart';

class MentorProfileModifyBloc extends Bloc<MentorProfileModifyEvent, MentorProfileModifyState> {
  MentorProfileModifyBloc(): super(const MentorProfileModifyState()) {
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

  Future<void> _modifyEmail(
    MentorProfileModifyEmail event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _onPressedEmailVerify(
    MentorProfileModifyEmailVerifyPressed event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyEmailVerify(
    MentorProfileModifyEmailVerify event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _onPressedEmailVerifyConfirm(
    MentorProfileModifyEmailVerifyConfirmPressed event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyOpenChatLink(
    MentorProfileModifyOpenChatLink event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyJobGroup(
    MentorProfileModifyJobGroup event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyJobDetail(
    MentorProfileModifyJobDetail event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyIntroduction(
    MentorProfileModifyIntroduction event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _modifyDescription(
    MentorProfileModifyDescription event,
    Emitter<MentorProfileModifyState> emit
  ) async { }

  Future<void> _onPressedSave(
    MentorProfileModifySave event,
    Emitter<MentorProfileModifyState> emit
  ) async { }
}
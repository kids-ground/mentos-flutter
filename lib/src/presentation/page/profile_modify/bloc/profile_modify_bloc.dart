import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

part 'profile_modify_event.dart';
part 'profile_modify_state.dart';

class ProfileModifyBloc extends Bloc<ProfileModifyEvent, ProfileModifyState> {
  ProfileModifyBloc() : super(ProfileModifyState()) {
    on<ProfileModifyGetProfile>(_getProfile);
    on<ProfileModifySelectedImage>(_selectedImage);
    on<ProfileModifyNickname>(_changeNickname);
    on<ProfileModifySave>(_save);
  }

  Future<void> _getProfile(
    ProfileModifyGetProfile event,
    Emitter<ProfileModifyState> emit,
  ) async {
    // localDB에서 Member 가져오기
    // const memberResponse = MemberResponse(
    //   profile_image: 'https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png',
    //   profile_thumbnail_image: 'https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png',
    //   nickname: '로건'
    // );
    //
    // emit(state.copyWith(memberResponse: memberResponse));
  }

  Future<void> _selectedImage(
    ProfileModifySelectedImage event,
    Emitter<ProfileModifyState> emit,
  ) async {
    emit(state.copyWith(newProfileImageFile: event.image));
  }

  Future<void> _changeNickname(
    ProfileModifyNickname event,
    Emitter<ProfileModifyState> emit,
  ) async {
    emit(state.copyWith(newNickname: event.nickname));
  }

  Future<void> _save(
    ProfileModifySave event,
    Emitter<ProfileModifyState> emit,
  ) async {
    // - nickname 및 사진 검증 & 업로드
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    await Future.delayed(const Duration(milliseconds: 700));
    emit(state.copyWith(loadingStatus: LoadingStatus.success));
  }
}

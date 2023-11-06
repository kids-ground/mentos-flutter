import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/request/member/member_modify_request.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';
import 'package:mentos_flutter/src/data/repository/network/image_repository.dart';
import 'package:mentos_flutter/src/data/repository/network/member_repository.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

part 'profile_modify_event.dart';
part 'profile_modify_state.dart';

class ProfileModifyBloc extends Bloc<ProfileModifyEvent, ProfileModifyState> {
  ProfileModifyBloc({
    required MemberRepository memberRepository,
    required ImageRepository imageRepository
  }): _memberRepository = memberRepository,
        _imageRepository = imageRepository,
        super(ProfileModifyState()) {
    on<ProfileModifyGetProfile>(_getProfile);
    on<ProfileModifySelectedImage>(_selectedImage);
    on<ProfileModifyNickname>(_changeNickname);
    on<ProfileModifySave>(_save);
  }

  final MemberRepository _memberRepository;
  final ImageRepository _imageRepository;

  Future<void> _getProfile(
    ProfileModifyGetProfile event,
    Emitter<ProfileModifyState> emit,
  ) async {
    final response = await _memberRepository.getMember();
    emit(state.copyWith(memberResponse: response));
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
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    String? newImageUrl;
    if (state.newProfileImageFile != null) {
      var compressedFile = await _compressFile(state.newProfileImageFile!);
      final imageResponse = await _imageRepository.uploadImage(compressedFile);
      newImageUrl = imageResponse.url;
    }

    final request = MemberModifyRequest(
      nickname: state.newNickname,
      profileUrl: newImageUrl
    );
    final response = await _memberRepository.modifyMember(request);

    emit(state.copyWith(loadingStatus: LoadingStatus.success));
  }

  Future<File> _compressFile(File file) async {
    final filePath = file.absolute.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    // final lastIndex = filePath.lastIndexOf(new RegExp(r'.'));
    // final splitted = filePath.substring(0, (lastIndex));
    // final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    // logger.i(outPath);

    var result = await FlutterImageCompress.compressAndGetFile(
      filePath,
      '${filePath}compressed.jpg',
      quality: 25,
    );

    File compressedFile = File(result!.path);
    return compressedFile;
  }
}

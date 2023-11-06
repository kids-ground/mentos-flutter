import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/request/post/post_write_request.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

part 'request_modify_event.dart';
part 'request_modify_state.dart';

class RequestModifyBloc extends Bloc<RequestModifyEvent, RequestModifyState> {
  RequestModifyBloc({
    required PostRepository postRepository
  }) : _postRepository = postRepository, super(RequestModifyState()) {
    on<RequestModifySelectImages>(_selectedImages);
    on<RequestModifyTitle>(_onChangedTitle);
    on<RequestModifyTagList>(_onChangedTagList);
    on<RequestModifyContent>(_onChangedContent);
    on<RequestModifyPressedComplete>(_writeCompleted);
  }

  final PostRepository _postRepository;

  Future<void> _onChangedTitle(
    RequestModifyTitle event,
    Emitter<RequestModifyState> emit
  ) async {
    emit(state.copyWith(title: event.title));
  }

  Future<void> _onChangedTagList(
    RequestModifyTagList event,
    Emitter<RequestModifyState> emit
  ) async {
    emit(state.copyWith(tagList: event.tagList));
  }

  Future<void> _onChangedContent(
    RequestModifyContent event,
    Emitter<RequestModifyState> emit
  ) async {
    emit(state.copyWith(content: event.content));
  }

  Future<void> _selectedImages(
    RequestModifySelectImages event,
    Emitter<RequestModifyState> emit
  ) async {
    List<File> newImages = event.selectedImages + state.selectedImageFileList;
    emit(state.copyWith(selectedImageFileList: newImages));
  }

  Future<void> _writeCompleted(
      RequestModifyPressedComplete event,
      Emitter<RequestModifyState> emit
  ) async {
    emit(state.copyWith(writeLoadingStatus: LoadingStatus.loading));
    final request = PostWriteRequest(title: state.title, tags: state.tagList, description: state.content);
    final response = await _postRepository.writePost(request);

    emit(state.copyWith(writeLoadingStatus: LoadingStatus.success, newPostId: response.postId));
  }
}

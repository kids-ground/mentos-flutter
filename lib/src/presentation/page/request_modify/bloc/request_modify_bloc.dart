import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_modify_event.dart';
part 'request_modify_state.dart';

class RequestModifyBloc extends Bloc<RequestModifyEvent, RequestModifyState> {
  RequestModifyBloc() : super(RequestModifyState()) {
    on<RequestModifySelectImages>(_selectedImages);
    on<RequestModifyTitle>(_onChangedTitle);
    on<RequestModifyTagList>(_onChangedTagList);
    on<RequestModifyContent>(_onChangedContent);
  }

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
}

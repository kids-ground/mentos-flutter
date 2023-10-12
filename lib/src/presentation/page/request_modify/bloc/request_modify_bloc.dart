import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_modify_event.dart';
part 'request_modify_state.dart';

class RequestModifyBloc extends Bloc<RequestModifyEvent, RequestModifyState> {
  RequestModifyBloc() : super(RequestModifyState()) {
    on<RequestModifySelectImages>(_selectedImages);
  }

  Future<void> _selectedImages(
    RequestModifySelectImages event,
    Emitter<RequestModifyState> emit
  ) async {
    List<File> newImages = event.selectedImages + state.selectedImageFileList;
    emit(state.copyWith(selectedImageFileList: newImages));
  }
}

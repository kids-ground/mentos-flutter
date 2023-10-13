import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_post_detail_event.dart';
part 'request_post_detail_state.dart';

class RequestPostDetailBloc extends Bloc<RequestPostDetailEvent, RequestPostDetailState> {
  RequestPostDetailBloc() : super(const RequestPostDetailState()) {
    on<RequestPostDetailCommentWrite>(_onWritingComment);
    on<RequestPostDetailCommentReply>(_onPressedReply);
    on<RequestPostDetailCommentReplyCancel>(_onPressedReplyCancel);
    on<RequestPostDetailCommentSend>(_onPressedSend);
  }

  Future<void> _onWritingComment(
    RequestPostDetailCommentWrite event,
    Emitter<RequestPostDetailState> emit
  ) async {
    emit(state.copyWith(comment: event.comment));
  }

  Future<void> _onPressedReply(
    RequestPostDetailCommentReply event,
    Emitter<RequestPostDetailState> emit
  ) async {
    emit(state.copyWith(replyCommentId: event.commentId));
  }

  Future<void> _onPressedReplyCancel(
    RequestPostDetailCommentReplyCancel event,
    Emitter<RequestPostDetailState> emit
  ) async {
    emit(state.copyWith(replyCommentId: 0));
  }

  Future<void> _onPressedSend(
    RequestPostDetailCommentSend event,
    Emitter<RequestPostDetailState> emit
  ) async {}
}
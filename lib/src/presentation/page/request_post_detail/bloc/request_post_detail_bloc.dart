import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_list_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_response.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';

part 'request_post_detail_event.dart';
part 'request_post_detail_state.dart';

class RequestPostDetailBloc extends Bloc<RequestPostDetailEvent, RequestPostDetailState> {
  RequestPostDetailBloc({
    required PostRepository postRepository
  }) : _postRepository = postRepository, super(const RequestPostDetailState()) {
    on<RequestPostDetailLoadPost>(_loadPost);
    on<RequestPostDetailLoadCommentList>(_loadCommentList);
    on<RequestPostDetailCommentWrite>(_onWritingComment);
    on<RequestPostDetailCommentReply>(_onPressedReply);
    on<RequestPostDetailCommentReplyCancel>(_onPressedReplyCancel);
    on<RequestPostDetailCommentSend>(_onPressedSend);
  }

  final PostRepository _postRepository;

  Future<void> _loadPost(
    RequestPostDetailLoadPost event,
    Emitter<RequestPostDetailState> emit
  ) async {
     final post = await _postRepository.getPost(event.postId);

     emit(state.copyWith(post: post));
  }

  Future<void> _loadCommentList(
      RequestPostDetailLoadCommentList event,
      Emitter<RequestPostDetailState> emit
  ) async {
    if (event.postId == null && state.post?.postId == null) return;
    final commentList = await _postRepository.getCommentList(event.postId ?? state.post!.postId);
    emit(state.copyWith(commentList: commentList.result));
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
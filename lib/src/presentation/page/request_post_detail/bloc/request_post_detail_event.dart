part of 'request_post_detail_bloc.dart';

abstract class RequestPostDetailEvent extends Equatable {
  const RequestPostDetailEvent();

  @override
  List<Object> get props => [];
}

class RequestPostDetailLoadPost extends RequestPostDetailEvent {
  const RequestPostDetailLoadPost({
    required this.postId
  });

  final int postId;
}

class RequestPostDetailLoadCommentList extends RequestPostDetailEvent {
  const RequestPostDetailLoadCommentList({
    this.postId
  });

  final int? postId;
}

class RequestPostDetailCommentWrite extends RequestPostDetailEvent {
  const RequestPostDetailCommentWrite({
    required this.comment
  });

  final String comment;
}

class RequestPostDetailCommentReply extends RequestPostDetailEvent {
  const RequestPostDetailCommentReply({
    required this.commentId
  });

  final int commentId;
}

class RequestPostDetailCommentReplyCancel extends RequestPostDetailEvent {
  const RequestPostDetailCommentReplyCancel();
}

class RequestPostDetailCommentSend extends RequestPostDetailEvent {
  const RequestPostDetailCommentSend();
}
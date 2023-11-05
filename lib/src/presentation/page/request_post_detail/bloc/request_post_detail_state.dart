part of 'request_post_detail_bloc.dart';

class RequestPostDetailState extends Equatable {
  const RequestPostDetailState({
    this.replyCommentId = 0,
    this.comment = '',
    this.post,
    this.commentList = const <CommentResponse>[]
  });

  final int replyCommentId;
  final String comment;

  final PostResponse? post;
  final List<CommentResponse> commentList;

  RequestPostDetailState copyWith({
    int? replyCommentId,
    String? comment,
    PostResponse? post,
    List<CommentResponse>? commentList
  }) => RequestPostDetailState(
    replyCommentId: replyCommentId ?? this.replyCommentId,
    comment: comment ?? this.comment,
    post: post ?? this.post,
    commentList: commentList ?? this.commentList
  );

  bool get canSend => comment.isNotEmpty;

  @override
  List<Object?> get props => [replyCommentId, comment, post, commentList];
}
part of 'request_post_detail_bloc.dart';

class RequestPostDetailState extends Equatable {
  const RequestPostDetailState({
    this.replyCommentId = 0,
    this.comment = ''
  });

  final int replyCommentId;
  final String comment;

  RequestPostDetailState copyWith({
    int? replyCommentId,
    String? comment
  }) => RequestPostDetailState(
    replyCommentId: replyCommentId ?? this.replyCommentId,
    comment: comment ?? this.comment
  );

  bool get canSend => comment.isNotEmpty;

  @override
  List<Object?> get props => [replyCommentId, comment];
}
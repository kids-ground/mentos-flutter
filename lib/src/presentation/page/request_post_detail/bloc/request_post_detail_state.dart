part of 'request_post_detail_bloc.dart';

class RequestPostDetailState extends Equatable {
  const RequestPostDetailState({
    this.taggedMember,
    this.comment = '',
    this.post,
    this.commentList = const <CommentResponse>[]
  });

  final MemberResponse? taggedMember;
  final String comment;

  final PostResponse? post;
  final List<CommentResponse> commentList;

  RequestPostDetailState copyWith({
    MemberResponse? taggedMember,
    String? comment,
    PostResponse? post,
    List<CommentResponse>? commentList
  }) => RequestPostDetailState(
    taggedMember: taggedMember ?? this.taggedMember,
    comment: comment ?? this.comment,
    post: post ?? this.post,
    commentList: commentList ?? this.commentList
  );

  RequestPostDetailState removeTagged() => RequestPostDetailState(
      taggedMember: null,
      comment: comment,
      post: post,
      commentList: commentList
  );

  RequestPostDetailState sendComment() => RequestPostDetailState(
      taggedMember: null,
      comment: '',
      post: post,
      commentList: commentList
  );

  bool get canSend => comment.isNotEmpty;

  @override
  List<Object?> get props => [taggedMember, comment, post, commentList];
}
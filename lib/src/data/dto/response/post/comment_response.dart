import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';

part 'comment_response.g.dart';
part 'comment_response.freezed.dart';

@freezed
class CommentResponse with _$CommentResponse {
  @JsonSerializable()
  factory CommentResponse({
    required int commentId,
    required String content,
    DateTime? createdAt,
    required MemberResponse writer,
    MemberResponse? taggedMemer
  }) = _CommentResponse;

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
}
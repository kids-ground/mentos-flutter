import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_response.dart';

part 'comment_list_response.g.dart';
part 'comment_list_response.freezed.dart';

@freezed
class CommentListResponse with _$CommentListResponse {
  @JsonSerializable()
  factory CommentListResponse({
    required List<CommentResponse> result
  }) = _CommentListResponse;

  factory CommentListResponse.fromJson(Map<String, dynamic> json) => _$CommentListResponseFromJson(json);
}
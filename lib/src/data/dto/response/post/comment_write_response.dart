import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_write_response.g.dart';
part 'comment_write_response.freezed.dart';

@freezed
class CommentWriteResponse with _$CommentWriteResponse {
  @JsonSerializable()
  factory CommentWriteResponse({
    required int commentId
  }) = _CommentWriteResponse;

  factory CommentWriteResponse.fromJson(Map<String, dynamic> json) => _$CommentWriteResponseFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_write_request.g.dart';
part 'comment_write_request.freezed.dart';

@freezed
class CommentWriteRequest with _$CommentWriteRequest {
  @JsonSerializable()
  factory CommentWriteRequest({
    required String comment,
    int? taggingMemberId
  }) = _CommentWriteRequest;

  factory CommentWriteRequest.fromJson(Map<String, dynamic> json) => _$CommentWriteRequestFromJson(json);
}
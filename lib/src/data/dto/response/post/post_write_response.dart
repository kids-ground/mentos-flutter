import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_write_response.g.dart';
part 'post_write_response.freezed.dart';

@freezed
class PostWriteResponse with _$PostWriteResponse {
  @JsonSerializable()
  factory PostWriteResponse({
    required int postId
  }) = _PostWriteResponse;

  factory PostWriteResponse.fromJson(Map<String, dynamic> json) => _$PostWriteResponseFromJson(json);
}
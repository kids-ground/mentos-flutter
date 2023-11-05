import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_write_request.g.dart';
part 'post_write_request.freezed.dart';

@freezed
class PostWriteRequest with _$PostWriteRequest {
  @JsonSerializable()
  factory PostWriteRequest({
    required List<String> tags,
    required String title,
    required String description
  }) = _PostWriteRequest;

  factory PostWriteRequest.fromJson(Map<String, dynamic> json) => _$PostWriteRequestFromJson(json);
}
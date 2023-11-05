import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_modify_request.g.dart';
part 'post_modify_request.freezed.dart';

@freezed
class PostModifyRequest with _$PostModifyRequest {
  @JsonSerializable()
  factory PostModifyRequest({
    List<String>? tags,
    String? title,
    String? description
  }) = _PostModifyRequest;

  factory PostModifyRequest.fromJson(Map<String, dynamic> json) => _$PostModifyRequestFromJson(json);
}
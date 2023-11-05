import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_request.g.dart';
part 'post_list_request.freezed.dart';

@freezed
class PostListRequest with _$PostListRequest {
  @JsonSerializable()
  factory PostListRequest({
    int? cursor
  }) = _PostListRequest;

  factory PostListRequest.fromJson(Map<String, dynamic> json) => _$PostListRequestFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_response.dart';

part 'post_list_response.g.dart';
part 'post_list_response.freezed.dart';

@freezed
class PostListResponse with _$PostListResponse {
  @JsonSerializable()
  factory PostListResponse({
    required List<PostResponse> result
  }) = _PostListResponse;

  factory PostListResponse.fromJson(Map<String, dynamic> json) => _$PostListResponseFromJson(json);
}
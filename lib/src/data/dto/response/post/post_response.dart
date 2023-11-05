import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';

part 'post_response.g.dart';
part 'post_response.freezed.dart';

@freezed
class PostResponse with _$PostResponse {
  @JsonSerializable()
  factory PostResponse({
    required int postId,
    required List<String> tags,
    required String title,
    required String description,
    int? hit,
    int? commentCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    MemberResponse? writer
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
}
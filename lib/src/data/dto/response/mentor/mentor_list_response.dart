import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';

part 'mentor_list_response.g.dart';
part 'mentor_list_response.freezed.dart';

@freezed
class MentorListResponse with _$MentorListResponse {
  @JsonSerializable()
  factory MentorListResponse({
    required List<MentorResponse> result
  }) = _MentorListResponse;

  factory MentorListResponse.fromJson(Map<String, dynamic> json) => _$MentorListResponseFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mentor_modify_request.g.dart';
part 'mentor_modify_request.freezed.dart';

@freezed
class MentorModifyRequest with _$MentorModifyRequest {
  @JsonSerializable()
  factory MentorModifyRequest({
    String? kakaoChatLink,
    int? careerYears,
    int? jobGroup,
    String? jobDetail,
    String? introduce,
    String? description,
  }) = _MentorModifyRequest;

  factory MentorModifyRequest.fromJson(Map<String, dynamic> json) => _$MentorModifyRequestFromJson(json);
}
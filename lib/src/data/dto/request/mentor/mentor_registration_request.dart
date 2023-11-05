import 'package:freezed_annotation/freezed_annotation.dart';

part 'mentor_registration_request.g.dart';
part 'mentor_registration_request.freezed.dart';

@freezed
class MentorRegistrationRequest with _$MentorRegistrationRequest {
  @JsonSerializable()
  factory MentorRegistrationRequest({
    required String kakaoChatLink,
    required int careerYears,
    required int jobGroup,
    String? jobDetail,
    required String introduce,
    String? description,
  }) = _MentorRegistrationRequest;

  factory MentorRegistrationRequest.fromJson(Map<String, dynamic> json) => _$MentorRegistrationRequestFromJson(json);
}
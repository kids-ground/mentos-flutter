import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_response.dart';

part 'mentor_registration_response.g.dart';
part 'mentor_registration_response.freezed.dart';

@freezed
class MentorRegistrationResponse with _$MentorRegistrationResponse {
  @JsonSerializable()
  factory MentorRegistrationResponse({
    required int mentorId
  }) = _MentorRegistrationResponse;

  factory MentorRegistrationResponse.fromJson(Map<String, dynamic> json) => _$MentorRegistrationResponseFromJson(json);
}
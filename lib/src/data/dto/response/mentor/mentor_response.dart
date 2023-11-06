import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';

part 'mentor_response.g.dart';
part 'mentor_response.freezed.dart';

@freezed
class MentorResponse with _$MentorResponse {
  @JsonSerializable()
  factory MentorResponse({
    required int mentorId,
    required String introduce,
    String? description,
    required String kakaoChatLink,
    required int jobGroup,
    String? jobDetail,
    required int careerYears,
    int? bookmarkCount,
    int? reviewCount,
    int? mentoringCount,
    double? reviewScore,
    required MemberResponse member
  }) = _MentorResponse;

  factory MentorResponse.fromJson(Map<String, dynamic> json) => _$MentorResponseFromJson(json);
}
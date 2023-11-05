import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_response.g.dart';
part 'member_response.freezed.dart';

@freezed
class MemberResponse with _$MemberResponse {
  @JsonSerializable()
  factory MemberResponse({
    required int memberId,
    required String nickname,
    String? profileUrl,
    String? thumbnailUrl,
    bool? alarmOn,
    String? currentCorporationName,
    String? currentJobDetail,
  }) = _MemberResponse;

  factory MemberResponse.fromJson(Map<String, dynamic> json) => _$MemberResponseFromJson(json);
}
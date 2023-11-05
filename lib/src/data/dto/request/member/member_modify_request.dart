import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_modify_request.g.dart';
part 'member_modify_request.freezed.dart';

@freezed
class MemberModifyRequest with _$MemberModifyRequest {
  @JsonSerializable()
  factory MemberModifyRequest({
    String? nickname,
    String? profileUrl,
  }) = _MemberModifyRequest;

  factory MemberModifyRequest.fromJson(Map<String, dynamic> json) => _$MemberModifyRequestFromJson(json);
}
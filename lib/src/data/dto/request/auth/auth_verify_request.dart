import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_verify_request.g.dart';
part 'auth_verify_request.freezed.dart';

@freezed
class AuthVerifyRequest with _$AuthVerifyRequest {
  @JsonSerializable()
  factory AuthVerifyRequest({
    required String authVerifyType,
    required int verifyNumber
  }) = _AuthVerifyRequest;

  factory AuthVerifyRequest.fromJson(Map<String, dynamic> json) => _$AuthVerifyRequestFromJson(json);
}
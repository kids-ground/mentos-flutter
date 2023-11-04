
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';
part 'login_request.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  @JsonSerializable()
  factory LoginRequest({
    required String loginType,
    required String token,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}
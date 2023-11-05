import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_email_request.g.dart';
part 'auth_email_request.freezed.dart';

@freezed
class AuthEmailRequest with _$AuthEmailRequest {
  @JsonSerializable()
  factory AuthEmailRequest({
    required String email,
  }) = _AuthEmailRequest;

  factory AuthEmailRequest.fromJson(Map<String, dynamic> json) => _$AuthEmailRequestFromJson(json);
}
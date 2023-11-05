import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_response.g.dart';
part 'simple_response.freezed.dart';

@freezed
class SimpleResponse with _$SimpleResponse {
  @JsonSerializable()
  factory SimpleResponse({
    int? code,
    String? message,
  }) = _SimpleResponse;

  factory SimpleResponse.fromJson(Map<String, dynamic> json) => _$SimpleResponseFromJson(json);
}
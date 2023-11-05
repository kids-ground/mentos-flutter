import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_upload_response.g.dart';
part 'image_upload_response.freezed.dart';

@freezed
class ImageUploadResponse with _$ImageUploadResponse {
  @JsonSerializable()
  factory ImageUploadResponse({
    required String url
  }) = _ImageUploadResponse;

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) => _$ImageUploadResponseFromJson(json);
}
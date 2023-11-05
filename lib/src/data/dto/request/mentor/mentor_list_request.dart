import 'package:freezed_annotation/freezed_annotation.dart';

part 'mentor_list_request.g.dart';
part 'mentor_list_request.freezed.dart';

@freezed
class MentorListRequest with _$MentorListRequest {
  @JsonSerializable()
  factory MentorListRequest({
    int? cursor,
    List<int>? ids
  }) = _MentorListRequest;

  factory MentorListRequest.fromJson(Map<String, dynamic> json) => _$MentorListRequestFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_set_request.g.dart';
part 'notification_set_request.freezed.dart';

@freezed
class NotificationSetRequest with _$NotificationSetRequest {
  @JsonSerializable()
  factory NotificationSetRequest({
    required bool alarmOn
  }) = _NotificationSetRequest;

  factory NotificationSetRequest.fromJson(Map<String, dynamic> json) => _$NotificationSetRequestFromJson(json);
}
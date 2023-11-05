import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/data/dto/request/member/member_modify_request.dart';
import 'package:mentos_flutter/src/data/dto/request/member/notification_set_request.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';
import 'package:mentos_flutter/src/data/dto/response/simple/simple_response.dart';
import 'package:retrofit/retrofit.dart';

part 'member_repository.g.dart';

@RestApi()
abstract class MemberRepository {
  factory MemberRepository(Dio dio, {String baseUrl}) = _MemberRepository;

  @GET("/members")
  Future<MemberResponse> getMember();

  @PATCH("/members")
  Future<MemberResponse> modifyMember(@Body() MemberModifyRequest request);

  @DELETE("/members")
  Future<SimpleResponse> deleteMember();

  @POST("/members/notifications")
  Future<SimpleResponse> setNotificationAlarm(@Body() NotificationSetRequest request);
}

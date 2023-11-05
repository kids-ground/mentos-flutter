import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/data/dto/request/mentor/mentor_list_request.dart';
import 'package:mentos_flutter/src/data/dto/request/mentor/mentor_modify_request.dart';
import 'package:mentos_flutter/src/data/dto/request/mentor/mentor_registration_request.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_list_response.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_registration_response.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';
import 'package:mentos_flutter/src/data/dto/response/simple/simple_response.dart';
import 'package:retrofit/retrofit.dart';

part 'mentor_repository.g.dart';

@RestApi()
abstract class MentorRepository {
  factory MentorRepository(Dio dio, {String baseUrl}) = _MentorRepository;

  @POST("/mentors")
  Future<MentorRegistrationResponse> writeMentorProfile(@Body() MentorRegistrationRequest request);

  @PATCH("/mentors")
  Future<SimpleResponse> modifyMentorProfile(@Body() MentorModifyRequest request);

  @GET("/mentors/{mentorId}")
  Future<MentorResponse> getMentorProfile(@Path() String postId);

  @GET("/mentors")
  Future<MentorListResponse> getMentorList(@Queries() MentorListRequest queries);
}

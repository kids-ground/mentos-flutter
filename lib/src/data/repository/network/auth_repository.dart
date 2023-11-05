import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/data/dto/request/auth/auth_email_request.dart';
import 'package:mentos_flutter/src/data/dto/request/auth/auth_verify_request.dart';
import 'package:mentos_flutter/src/data/dto/request/login/login_request.dart';
import 'package:mentos_flutter/src/data/dto/response/login/login_response.dart';
import 'package:mentos_flutter/src/data/dto/response/simple/simple_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST("/auth/login")
  Future<LoginResponse> signIn(@Body() LoginRequest request);

  @POST("/auth/email")
  Future<SimpleResponse> authEmail(@Body() AuthEmailRequest request);

  @POST("/auth/verify")
  Future<SimpleResponse> authVerify(@Body() AuthVerifyRequest request);
}

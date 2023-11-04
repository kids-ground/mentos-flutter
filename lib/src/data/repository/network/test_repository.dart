import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'test_repository.g.dart';

@RestApi()
abstract class TestRepository {
  factory TestRepository(Dio dio, {String baseUrl}) = _TestRepository;

  @GET("/test/network")
  Future<String> getTestNetwork();
}

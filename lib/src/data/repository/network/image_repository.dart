import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/data/dto/response/image/image_upload_response.dart';
import 'package:retrofit/retrofit.dart';

part 'image_repository.g.dart';

@RestApi()
abstract class ImageRepository {
  factory ImageRepository(Dio dio, {String baseUrl}) = _ImageRepository;

  @POST("/images/upload")
  @MultiPart()
  Future<ImageUploadResponse> uploadImage(@Part() File image);
}

import 'package:dio/dio.dart';
import 'package:mentos_flutter/src/data/dto/request/post/comment_write_request.dart';
import 'package:mentos_flutter/src/data/dto/request/post/post_list_request.dart';
import 'package:mentos_flutter/src/data/dto/request/post/post_modify_request.dart';
import 'package:mentos_flutter/src/data/dto/request/post/post_write_request.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_list_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_write_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_list_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_write_response.dart';
import 'package:mentos_flutter/src/data/dto/response/simple/simple_response.dart';
import 'package:retrofit/retrofit.dart';

part 'post_repository.g.dart';

@RestApi()
abstract class PostRepository {
  factory PostRepository(Dio dio, {String baseUrl}) = _PostRepository;

  @POST("/posts")
  Future<PostWriteResponse> writePost(@Body() PostWriteRequest request);

  @PATCH("/posts/{postId}")
  Future<SimpleResponse> modifyPost(@Path() String postId, @Body() PostModifyRequest request);

  @DELETE("/posts/{postId}")
  Future<SimpleResponse> deletePost(@Path() String postId);

  @GET("/posts/{postId}")
  Future<PostResponse> getPost(@Path() String postId);

  @GET("/posts")
  Future<PostListResponse> getPostList(@Queries() PostListRequest queries);

  @POST("/posts/{postId}/comments")
  Future<CommentWriteResponse> writeComment(@Path() String postId, @Body() CommentWriteRequest request);

  @GET("/posts/{postId}/comments")
  Future<CommentListResponse> getCommentList(@Path() String postId);
}

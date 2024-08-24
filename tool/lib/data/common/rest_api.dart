import 'dart:io';

import 'package:tool/data/models/base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  // Auth

  @POST("/auth/login")
  Future<BaseResponse> loginWithEmail(@Body() Map<String, dynamic> body);

  // User
  @GET("/user")
  Future<BaseResponse> getMyProfile(@Queries() Map<String, dynamic> queries);

  @DELETE("/user/{userId}")
  Future<BaseResponse> deleteAccount(@Path() String userId);

  @POST("/image/{sizeImage}")
  Future<BaseResponse> uploadImage(@Part() File file, {@Path() int? sizeImage});
}

import 'package:dio/dio.dart';
import 'package:oivan_exam/core/dto/base_api_dto.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  // // get users
  @GET('/users')
  Future<BaseApiDto<List<UserDto>>> getUsers({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('site') String? site,
  });

  @GET('/users/{ids}/reputation-history')
  Future<BaseApiDto<List<ReputationHistoryDto>>> getUserReputation({
    @Path("ids") int? userId,
    @Query('page') int? page,
    @Query('access_token') String? accessToken,
    @Query('pageSize') int? pageSize,
    @Query('site') String? site,
  });

  @GET('/users/{id}/top-tags')
  Future<BaseApiDto<List<TagDto>>> getUserTopTags({
    @Path("id") int? userId,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('site') String? site,
  });
  // /// login
  // @POST("/api/token")
  // Future<BaseApiDto<AccessToken>> getToken(
  //   @Body() LoginDto model,
  // );
}

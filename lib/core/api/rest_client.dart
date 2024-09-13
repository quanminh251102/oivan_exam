import 'package:dio/dio.dart';
import 'package:oivan_exam/core/dto/base_api_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  // // get users
  @GET('/api/chat_room')
  Future<BaseApiDto<List<UserDto>>> getUsers({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
  });

  // /// login
  // @POST("/api/token")
  // Future<BaseApiDto<AccessToken>> getToken(
  //   @Body() LoginDto model,
  // );
}

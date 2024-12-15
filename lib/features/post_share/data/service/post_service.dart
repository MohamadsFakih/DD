import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'post_service.g.dart';

/// The contract for the login remote service.
/// This represent the blue print for the service.
@RestApi()
@injectable
abstract class PostService {
  @factoryMethod
  factory PostService(Dio dio) {
    // dio.interceptors.add(AuthInterceptor());
    return _PostService(dio);
  }

  @POST(APIConstant.posShare)
  Future<PostResponse> postShare(@Body() PostParams model);
  @GET(APIConstant.getVideo)
  Future<GetVideoResponse> getVideo(@Body() GetVideoParams params);
}

import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/di/interceptors.dart';
import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'common_service.g.dart';

/// The contract for the login remote service.
/// This represent the blue print for the service.
@RestApi()
@injectable
abstract class CommonService {
  @factoryMethod
  factory CommonService(Dio dio) {
    dio.interceptors.add(AuthInterceptor());
    return _CommonService(dio);
  }

  @GET(APIConstant.getVideo)
  Future<GetVideoResponse> getVideo(
    @Query('type') int type,
    @Query('socialType') int socialType,
  );
  @POST(APIConstant.sendActivity)
  Future<SendContentResponse> sendActivity(
    @Body() SendActivityParams params,
  );
}

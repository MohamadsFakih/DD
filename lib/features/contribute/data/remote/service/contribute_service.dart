import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/di/interceptors.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'contribute_service.g.dart';

/// The contract for the login remote service.
/// This represent the blue print for the service.
@RestApi()
@injectable
abstract class ContributeService {
  @factoryMethod
  factory ContributeService(Dio dio) {
    dio.interceptors.add(AuthInterceptor());
    return _ContributeService(dio);
  }

  @POST(APIConstant.sendContent)
  Future<PostResponse> submitPost(@Body() SendContentParams params);
}

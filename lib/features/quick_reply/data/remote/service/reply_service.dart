import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'reply_service.g.dart';

/// The contract for the login remote service.
/// This represent the blue print for the service.
@RestApi()
@injectable
abstract class ReplyService {
  @factoryMethod
  factory ReplyService(Dio dio) {
    // dio.interceptors.add(AuthInterceptor());
    return _ReplyService(dio);
  }

  @POST(APIConstant.quickReply)
  Future<PostResponse> quickReply(@Body() ReplyParams params);
}

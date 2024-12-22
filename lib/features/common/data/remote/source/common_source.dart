import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';

abstract class CommonSource {
  Future<GetVideoResponse> getVideo(
    int type,
    int socialType,
  );
  Future<SendContentResponse> sendActivity(
    SendActivityParams params,
  );
}

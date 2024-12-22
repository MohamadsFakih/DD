import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';

abstract class CommonSource {
  Future<GetVideoResponse> getVideo(
    int type,
    int socialType,
  );
}

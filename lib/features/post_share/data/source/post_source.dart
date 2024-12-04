import 'package:digital_defender/features/post_share/data/model/get_video_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';

abstract class PostSource {
  Future<PostResponse> postShare(PostParams model);
  Future<GetVideoResponse> getVideo(GetVideoParams params);
}

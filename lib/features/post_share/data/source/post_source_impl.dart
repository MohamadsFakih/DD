import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/post_share/data/service/post_service.dart';
import 'package:digital_defender/features/post_share/data/source/post_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostSource)
class PostSourceImpl implements PostSource {
  PostSourceImpl(this._postService);
  final PostService _postService;
  @override
  Future<PostResponse> postShare(PostParams model) =>
      _postService.postShare(model);

  @override
  Future<GetVideoResponse> getVideo() => _postService.getVideo();
}

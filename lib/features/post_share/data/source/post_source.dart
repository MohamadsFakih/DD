import 'package:digital_defender/features/post_share/data/model/post_params.dart';

abstract class PostSource {
  Future<PostResponse> postShare(PostParams model);
}

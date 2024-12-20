import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';

abstract class ContributeSource {
  Future<PostResponse> submitPost(SendContentParams params);
}

import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';

abstract class ReplySource {
  Future<PostResponse> quickReply(ReplyParams params);
}

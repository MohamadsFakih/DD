import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/data/remote/service/reply_service.dart';
import 'package:digital_defender/features/quick_reply/data/remote/source/reply_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ReplySource)
class ReplySourceImpl implements ReplySource {
  ReplySourceImpl(this._replyService);
  final ReplyService _replyService;
  @override
  Future<PostResponse> quickReply(ReplyParams params) =>
      _replyService.quickReply(params);
}

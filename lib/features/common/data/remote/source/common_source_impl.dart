import 'package:digital_defender/features/common/data/remote/service/common_service.dart';
import 'package:digital_defender/features/common/data/remote/source/common_source.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CommonSource)
class CommonSourceImpl implements CommonSource {
  CommonSourceImpl(this._commonService);
  final CommonService _commonService;
  @override
  Future<GetVideoResponse> getVideo(int type, int socialType) =>
      _commonService.getVideo(type, socialType);
}

import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/contribute/data/remote/service/contribute_service.dart';
import 'package:digital_defender/features/contribute/data/remote/source/contribute_source.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ContributeSource)
class ContributeSourceImpl implements ContributeSource {
  ContributeSourceImpl(this._contributeService);
  final ContributeService _contributeService;
  @override
  Future<PostResponse> submitPost(SendContentParams params) =>
      _contributeService.submitPost(params);
}
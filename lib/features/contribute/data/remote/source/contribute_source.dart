import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';

abstract class ContributeSource {
  Future<SendContentResponse> submitPost(SendContentParams params);
}

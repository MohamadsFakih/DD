/// The api routes constants.
///
/// Used for constructing the request url for the
/// target APIs.
///
class APIConstant {
  /// A private constructor to prevent
  /// making instances of this class.
  ///
  APIConstant._();

  /// The base url for the domain.
  ///
  static const String baseUrl = 'https://professor.proxy.beeceptor.com/';

  /// The dev url for the domain.
  ///
  static const String devUrl = 'https://professor.proxy.beeceptor.com/';

  ///
  ///
  static const String ddPath = 'dd/api/v1/';
  static const String userPath = 'api/User/';

  /// The route for the dashboard API.
  ///
  static const String posShare = '${ddPath}post';
  static const String getVideo = '${ddPath}getVideo';
  static const String quickReply = '${ddPath}quickReply';
}

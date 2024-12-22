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
  static const String devUrl = 'http://localhost:5142';

  ///
  ///
  static const String ddPath = 'dd/api/v1/';
  static const String userPath = 'api/User/';
  static const String v1 = '/api/v1/';

  /// The route for the dashboard API.
  ///
  static const String posShare = '${ddPath}post';
  static const String getVideo = '${v1}social-embed';
  static const String quickReply = '${ddPath}quickReply';
  static const String login = '${v1}login';
  static const String sendContent = '${v1}send-content';
  static const String sendActivity = '${v1}send-activity';
}

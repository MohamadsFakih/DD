// SecureStorage class
import 'dart:convert';

import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  /// Key for storing user data
  static const _userDataKey = 'userTokenData';

  /// Method to save LoginResponse to secure storage
  static Future<void> saveLoginResponse(LoginResponse response) async {
    final jsonString = jsonEncode(response.toJson());
    await _storage.write(key: _userDataKey, value: jsonString);
  }

  /// Method to get LoginResponse from secure storage
  static Future<LoginResponse?> getLoginResponse() async {
    final jsonString = await _storage.read(key: _userDataKey);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;
      return LoginResponse.fromJson(jsonMap);
    }
    return null;
  }

  /// Method to get LoginResponse from secure storage
  static Future<void> clearLoginResponse() async {
    await _storage.delete(key: _userDataKey);
  }
}

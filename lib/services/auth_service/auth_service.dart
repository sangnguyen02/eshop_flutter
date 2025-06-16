import '../../utils/local_storage/storage_utilities.dart';
import '../../utils/logging/logger.dart';

class AuthService {
  final LocalStorage _storage;

  AuthService(this._storage);

  Future<void> saveToken(String token) async {
    try {
      await _storage.saveData('jwt_token', token);
    } catch (e) {
      EshopLogger.error('Failed to save token: $e');
      throw Exception('Failed to save token');
    }
  }

  Future<String?> getToken() async {
    try {
      final token = await _storage.readData('jwt_token');
      // EshopLogger.info('Retrieved token: $token');
      return token;
    } catch (e) {
      EshopLogger.error('Failed to get token: $e');
      return null;
    }
  }

  Future<void> clearToken() async {
    try {
      await _storage.removeData('jwt_token');
      EshopLogger.info('Cleared token');
    } catch (e) {
      EshopLogger.error('Failed to clear token: $e');
      throw Exception('Failed to clear token');
    }
  }
}
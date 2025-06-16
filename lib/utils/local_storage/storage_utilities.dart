import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  Future<void> saveData(String key, String value);
  Future<String?> readData(String key);
  Future<void> removeData(String key);
  Future<void> clearAll();
}



class EshopLocalStorage implements LocalStorage {
  static final EshopLocalStorage _instance = EshopLocalStorage._internal();
  static bool _isInitialized = false;

  factory EshopLocalStorage() {
    if (!_isInitialized) {
      throw StateError('EshopLocalStorage has not been initialized. Call initialize() first.');
    }
    return _instance;
  }

  EshopLocalStorage._internal();

  final GetStorage _storage = GetStorage();

  static Future<void> initialize() async {
    if (!_isInitialized) {
      await GetStorage.init();
      _isInitialized = true;
    }
  }

  @override
  Future<void> saveData(String key, String value) async {
    if (!_isInitialized) {
      throw StateError('EshopLocalStorage not initialized');
    }
    await _storage.write(key, value);
  }

  @override
  Future<String?> readData(String key) async {
    if (!_isInitialized) {
      throw StateError('EshopLocalStorage not initialized');
    }
    return _storage.read<String>(key);
  }

  @override
  Future<void> removeData(String key) async {
    if (!_isInitialized) {
      throw StateError('EshopLocalStorage not initialized');
    }
    await _storage.remove(key);
  }

  @override
  Future<void> clearAll() async {
    if (!_isInitialized) {
      throw StateError('EshopLocalStorage not initialized');
    }
    await _storage.erase();
  }
}
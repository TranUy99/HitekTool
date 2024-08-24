import 'package:project/common/config/app_storage_key.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class LocalService extends GetxService {
  GetStorage? _appStorage;

  GetStorage get appStorage {
    _appStorage ??= GetStorage();
    return _appStorage!;
  }

  Future write(String key, String value) {
    return appStorage.write(key, value);
  }

  String? get language => appStorage.read(StorageKey.language);

  String? get token => appStorage.read(StorageKey.token);

  Future cacheLanguage(String language) {
    return write(StorageKey.language, language);
  }

  Future cacheToken(String token) {
    return write(StorageKey.token, token);
  }

  clear() async => appStorage.erase();
}

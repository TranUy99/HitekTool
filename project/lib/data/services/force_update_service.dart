import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

enum AppStatus { lowerThanMinVersion, oldVersion, latestVersion, none }

const androidMinVerKey = "android_min_version";
const androidLatestVerKey = "android_latest_version";

const iosMinVerKey = "ios_min_version";
const iosLatestVerKey = "ios_latest_version";

class ForceUpdateService extends GetxService {
  final _remoteConfig = FirebaseRemoteConfig.instance;
  final _isAndroid = Platform.isAndroid;

  Future<AppStatus> getAppVersionStatus() async {
    await _initialize();
    final minVerKey = _isAndroid ? androidMinVerKey : iosMinVerKey;
    final latestVerKey = _isAndroid ? androidLatestVerKey : iosLatestVerKey;

    final minVersion = _getParams(minVerKey);
    final latestVersion = _getParams(latestVerKey);

    if (minVersion.isEmpty || latestVersion.isEmpty) return AppStatus.none;

    final currentVersion = await _getCurrentVersion();
    final isLowerThanMinVersion = _checkVersion(currentVersion, minVersion);
    if (isLowerThanMinVersion) return AppStatus.lowerThanMinVersion;

    final isLowerThanLatestVersion = _checkVersion(currentVersion, latestVersion);
    if (isLowerThanLatestVersion) return AppStatus.oldVersion;

    return AppStatus.latestVersion;
  }

  bool _checkVersion(
    String currentVersion,
    String remoteConfigVersion,
  ) {
    List<int> versionCurrentNumbers = currentVersion.split('.').map(int.parse).toList();
    List<int> versionRemoteConfigNumbers = remoteConfigVersion.split('.').map(int.parse).toList();

    // Ensure both version number lists have the same length
    while (versionCurrentNumbers.length < versionRemoteConfigNumbers.length) {
      versionCurrentNumbers.add(0);
    }

    while (versionRemoteConfigNumbers.length < versionCurrentNumbers.length) {
      versionRemoteConfigNumbers.add(0);
    }

    int comparison = 0;
    for (int i = 0; i < versionCurrentNumbers.length; i++) {
      if (versionCurrentNumbers[i] > versionRemoteConfigNumbers[i]) {
        comparison = 1;
        break;
      } else if (versionCurrentNumbers[i] < versionRemoteConfigNumbers[i]) {
        comparison = -1;
        break;
      }
    }

    if (comparison < 0) {
      return true;
    }

    return false;
  }

  Future<String> _getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  _initialize() async {
    await _setRemoteConfig();
    await _fetchRemoteConfig();
  }

  _setRemoteConfig() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: Duration.zero,
      ),
    );
  }

  _fetchRemoteConfig() async {
    await _remoteConfig.fetchAndActivate();
  }

  String _getParams(String key) {
    return _remoteConfig.getString(key);
  }
}

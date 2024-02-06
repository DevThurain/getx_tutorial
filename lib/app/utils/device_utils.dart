import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceUtils {
  static final DeviceUtils _instance = DeviceUtils._internal();
  late final DeviceInfoPlugin? _deviceInfoPlugin;

  factory DeviceUtils() {
    return _instance;
  }
  DeviceUtils._internal() {
    _deviceInfoPlugin = DeviceInfoPlugin();
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  String getDeviceOS() {
    return Platform.isAndroid ? 'Android' : 'IOS';
  }

  Future<String> getDeviceModel() async {
    String deviceInfo = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;
      deviceInfo = androidDeviceInfo.model.toString();
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      deviceInfo = iosDeviceInfo.model.toString();
    }
    return deviceInfo;
  }

  Future<String> getDeviceManufacture() async {
    String deviceManufacture;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;
      deviceManufacture = androidDeviceInfo.manufacturer;
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      deviceManufacture = iosDeviceInfo.identifierForVendor ?? "IOS";
    }
    return deviceManufacture;
  }

  Future<String> getDeviceVersion() async {
    String deviceVersion;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;
      deviceVersion = androidDeviceInfo.version.release;
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      deviceVersion = iosDeviceInfo.systemVersion ?? "1";
    }
    return deviceVersion;
  }

  Future<String> getDeviceID() async {
    String deviceID;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;
      deviceID = androidDeviceInfo.id;
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      deviceID = iosDeviceInfo.identifierForVendor ?? "";
    }
    return deviceID;
  }

  Future<String> getDeviceSDKVersion() async {
    String sdkVersion;
    _deviceInfoPlugin ??= DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;
      sdkVersion = androidDeviceInfo.version.sdkInt.toString();
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      sdkVersion = iosDeviceInfo.utsname.version!;
    }
    return sdkVersion;
  }

  Future<String> getDeviceSerialNumber() async {
    String serialNumber;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin!.androidInfo;

      serialNumber = androidDeviceInfo.id.replaceAll(".", "-");
    } else {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin!.iosInfo;
      serialNumber = iosDeviceInfo.identifierForVendor ?? "";
    }
    return serialNumber;
  }

  Future<DeviceInfoModel> getDeviceInfo() async {
    String serialNumber = await getDeviceSerialNumber();
    String sdkVersion = await getDeviceSDKVersion();
    String versionCode = await getVersion();
    String deviceVersion = await getDeviceSDKVersion();
    String manufacture = await getDeviceManufacture();
    String appID = await getDeviceID();

    return DeviceInfoModel(
        serialNumber: serialNumber,
        sdkVersion: sdkVersion,
        appID: appID,
        deviceVersion: deviceVersion,
        manufacture: manufacture,
        versionCode: versionCode);
  }
}

class DeviceInfoModel {
  String serialNumber;
  String sdkVersion;
  String versionCode;
  String deviceVersion;
  String manufacture;
  String appID;

  DeviceInfoModel(
      {required this.serialNumber,
      required this.sdkVersion,
      required this.appID,
      required this.deviceVersion,
      required this.manufacture,
      required this.versionCode});
}

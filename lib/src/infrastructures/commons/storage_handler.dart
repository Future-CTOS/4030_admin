import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageHandler {
  factory StorageHandler() => _instance;

  StorageHandler._();

  static final StorageHandler _instance = StorageHandler._();
  final _storage = GetStorage();

  //#region ------> Keys <------
  static const String _tokenKey = 'token';
  static const String _phoneNumberKey = 'phone_number';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _drawerSelectedIdKey = 'drawer_selected_id';
  //#endregion

  //#region ------> Token <------
  String? get token => _storage.read<String?>(_tokenKey);

  Future<void> setToken(String token) =>
      _storage.write(_tokenKey, token);

  Future<void> removeDriverToken() => _storage.remove(_tokenKey);
  //#endregion

  //#region ------> Phone Number <------
  String? get phoneNumber => _storage.read<String?>(_phoneNumberKey);

  Future<void> setPhoneNumber(String number) =>
      _storage.write(_phoneNumberKey, number);

  Future<void> removePhoneNumber() => _storage.remove(_phoneNumberKey);
  //#endregion

  //#region ------> isLoggedIn <------
  bool get isLoggedIn => _storage.read<bool>(_isLoggedInKey) ?? false;

  Future<void> setIsLoggedIn(bool value) =>
      _storage.write(_isLoggedInKey, value);

  Future<void> removeIsLoggedIn() => _storage.remove(_isLoggedInKey);
  //#endregion

  //#region ------> Drawer Selected Id <------
  int get drawerSelectedId => _storage.read<int>(_drawerSelectedIdKey) ?? 1;

  Future<void> setDrawerSelectedId(int value) =>
      _storage.write(_drawerSelectedIdKey, value);

  Future<void> removeDrawerSelectedId() =>
      _storage.remove(_drawerSelectedIdKey);
//#endregion
}

import 'package:flutter/cupertino.dart';

import '../../pages/driver_management/model/enums/user_status.dart';

class RepositoryUrls {
  const RepositoryUrls._();

  static const String _baseUrl = 'https://taxi-4030.ir/admin';
  static const String _auth = '/auth';
  static const String _drivers = '/drivers';

  static Uri filteredDrivers(UserStatus status) =>
      Uri.parse('$_baseUrl$_drivers?status=${status.value}');

  static Uri get login => Uri.parse('$_baseUrl$_auth/login');

  static Uri get allDrivers => Uri.parse('$_baseUrl$_drivers/all');

  static Uri get checkConnection => Uri.parse(_baseUrl);
}

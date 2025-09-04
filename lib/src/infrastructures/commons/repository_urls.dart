import 'package:flutter/cupertino.dart';

class RepositoryUrls {
  const RepositoryUrls._();

  static const String _baseUrl = 'https://taxi-4030.ir';

  static Uri login = Uri.parse('$_baseUrl/admin/auth/login');

  static Uri get checkConnection => Uri.parse(_baseUrl);
}

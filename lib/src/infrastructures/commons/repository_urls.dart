import 'package:flutter/cupertino.dart';

class RepositoryUrls {
  const RepositoryUrls._();

  static const String _baseUrl = 'https://taxi-4030.ir/admin';
  static const String _auth = '/auth';

  static Uri login = Uri.parse('$_baseUrl$_auth/login');

  static Uri get checkConnection => Uri.parse(_baseUrl);
}

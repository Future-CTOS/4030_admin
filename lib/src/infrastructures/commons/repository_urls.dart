import 'package:app_4030_admin/src/pages/driver_management/model/enums/current_vehicle.dart';

import '../../pages/driver_management/model/enums/user_status.dart';

class RepositoryUrls {
  const RepositoryUrls._();

  static const String _baseUrl = 'https://taxi-4030.ir/admin';
  static const String _auth = '/auth';
  static const String _drivers = '/drivers';
  static const String _users = '/users';
  static const String _passenger = '/passengers';

  static Uri filteredDrivers({
    required String? searchTarget,
    required UserStatus? userStatus,
    required VehicleType? vehicleType,
  }) {
    if (userStatus == null && vehicleType != null) {
      return Uri.parse(
        '$_baseUrl$_drivers?type=${vehicleType.value}&q=$searchTarget',
      );
    }

    if (userStatus != null && vehicleType == null) {
      return Uri.parse(
        '$_baseUrl$_drivers?status=${userStatus.value}&q=$searchTarget',
      );
    }

    return Uri.parse(
      '$_baseUrl$_drivers?status=${userStatus?.value}&type=${vehicleType?.value}&q=$searchTarget',
    );
  }

  static Uri allDocument({required int driverId}) =>
      Uri.parse('$_baseUrl$_drivers/$driverId/details');

  static Uri searchPassenger({required String searchTarget}) =>
      Uri.parse('$_baseUrl$_passenger/search?q=$searchTarget');

  static Uri deletedUser({required String type, required String userId}) =>
      Uri.parse('$_baseUrl$_users/$type/$userId');

  static Uri get login => Uri.parse('$_baseUrl$_auth/login');

  static Uri get allDrivers => Uri.parse('$_baseUrl$_drivers/all');

  static Uri get allPassenger => Uri.parse('$_baseUrl$_passenger');

  static Uri get checkConnection => Uri.parse(_baseUrl);
}

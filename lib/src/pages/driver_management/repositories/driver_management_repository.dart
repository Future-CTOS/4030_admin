import 'dart:convert';

import 'package:app_4030_admin/src/pages/driver_management/model/enums/user_status.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructures/commons/repository_urls.dart';
import '../../../infrastructures/commons/token_info.dart';
import '../model/enums/current_vehicle.dart';
import '../model/view_models/driver_management_view_model.dart';

class DriverManagementRepository {
  Future<Either<String, List<DriverManagementViewModel>>>
  fetchAllDriver() async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.allDrivers,
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        print('in all url');
        print(jsonData);
        final List<DriverManagementViewModel> driverViewModel = jsonData
            .map(
              (e) =>
                  DriverManagementViewModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        return Right(driverViewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, List<DriverManagementViewModel>>> fetchFilteredDriver({
    required String searchTarget,
    required UserStatus? userStatus,
    required VehicleType? vehicleType,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.filteredDrivers(
          searchTarget: searchTarget,
          userStatus: userStatus,
          vehicleType: vehicleType,
        ),
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<DriverManagementViewModel> driverViewModel = jsonData
            .map(
              (e) =>
                  DriverManagementViewModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        return Right(driverViewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

}

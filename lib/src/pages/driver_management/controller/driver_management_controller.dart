import 'package:app_4030_admin/src/pages/driver_management/model/enums/user_status.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/models/enums/status_enum.dart';
import '../../../infrastructures/utils/utils.dart';
import '../model/enums/current_vehicle.dart';
import '../model/view_models/driver_management_view_model.dart';
import '../repositories/driver_management_repository.dart';

class DriverManagementController extends GetxController {
  final Rxn<UserStatus> currentStatus = Rxn<UserStatus>();
  final Rxn<VehicleType> currentVehicle = Rxn<VehicleType>();
  final RxBool isLoading = false.obs;
  final _repository = DriverManagementRepository();
  List<DriverManagementViewModel> driverManagements = [];

  Future<void> _fetchAllDriver(BuildContext context) async {
    isLoading.value = true;
    final Either<String, List<DriverManagementViewModel>> result =
        await _repository.fetchAllDriver();
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        driverManagements = response;
      },
    );
  }

  Future<void> onRefreshDrivers(BuildContext context) async {
    if (currentStatus.value == UserStatus.allStatus) {
      _fetchAllDriver(context);
      return;
    }
    _fetchFilteredDriver(
      userStatus: currentStatus.value,
      vehicleType: currentVehicle.value!,
      context: context,
    );
  }

  void onSelectedStatusItem({
    required final UserStatus? status,
    required BuildContext context,
  }) {
    currentStatus.value = status;
    if (currentStatus.value == UserStatus.allStatus) {
      _fetchAllDriver(context);
      return;
    }
    _fetchFilteredDriver(
      userStatus: currentStatus.value,
      vehicleType: currentVehicle.value!,
      context: context,
    );
  }

  void onSelectedVehicleItem({
    required final VehicleType? status,
    required BuildContext context,
  }) {
    currentVehicle.value = status;

    if (currentVehicle.value == VehicleType.allVehicleType) {
      _fetchAllDriver(context);
      return;
    }
    _fetchFilteredDriver(
      userStatus: currentStatus.value,
      vehicleType: currentVehicle.value!,
      context: context,
    );
  }

  Future<void> _fetchFilteredDriver({
    required BuildContext context,
    required UserStatus? userStatus,
    required VehicleType? vehicleType,
  }) async {
    driverManagements.clear();
    isLoading.value = true;
    final Either<String, List<DriverManagementViewModel>> result =
        await _repository.fetchFilteredDriver(
          userStatus: userStatus,
          vehicleType: vehicleType,
        );
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        driverManagements = response;
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    _fetchAllDriver(Get.context!);
  }
}

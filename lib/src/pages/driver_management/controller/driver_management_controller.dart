import 'dart:async';

import 'package:app_4030_admin/src/infrastructures/commons/storage_handler.dart';
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
  final RxString searchTarget = RxString('');
  final RxBool isLoading = false.obs;

  final storage = StorageHandler();
  Timer? _debounce;
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

  Future<void> searchDrivers({
    required BuildContext context,
    required String searchBoxValue,
  }) async {
    if (searchBoxValue.isEmpty || searchBoxValue.length < 2) {
      driverManagements.clear();
      await _fetchAllDriver(context);
      return;
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      driverManagements.clear();
      isLoading.value = true;

      final Either<String, List<DriverManagementViewModel>> result =
          await _repository.fetchFilteredDriver(
            searchTarget: searchBoxValue,
            userStatus: currentStatus.value,
            vehicleType: currentVehicle.value,
          );

      isLoading.value = false;

      result.fold(
        (errorMessage) => Utils.showSnackBar(
          context,
          text: errorMessage,
          status: StatusEnum.danger,
        ),
        (response) {
          driverManagements = response;
        },
      );
    });
  }

  Future<void> onRefreshDrivers(BuildContext context) async {
    if (currentStatus.value == UserStatus.allStatus) {
      _fetchAllDriver(context);
      return;
    }
    _fetchFilteredDriver(
      searchTarget: searchTarget.value,
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
      searchTarget: searchTarget.value,
      userStatus: currentStatus.value,
      vehicleType: currentVehicle.value,
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
      searchTarget: searchTarget.value,
      userStatus: currentStatus.value,
      vehicleType: currentVehicle.value!,
      context: context,
    );
  }

  Future<void> _fetchFilteredDriver({
    required BuildContext context,
    required UserStatus? userStatus,
    required VehicleType? vehicleType,
    required String searchTarget,
  }) async {
    driverManagements.clear();
    isLoading.value = true;
    final Either<String, List<DriverManagementViewModel>> result =
        await _repository.fetchFilteredDriver(
          searchTarget: searchTarget,
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

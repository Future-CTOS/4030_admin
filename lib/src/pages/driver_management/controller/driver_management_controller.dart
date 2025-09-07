import 'package:app_4030_admin/gen/assets.gen.dart';
import 'package:app_4030_admin/src/pages/driver_management/model/enums/user_status.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/models/enums/status_enum.dart';
import '../../../infrastructures/utils/utils.dart';
import '../model/view_models/driver_management_view_model.dart';
import '../repositories/driver_management_repository.dart';

class DriverManagementController extends GetxController {
  final Rx<UserStatus> currentStatus = Rx<UserStatus>(UserStatus.allStatus);
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

  void onSelectedStatusItem({
    required final UserStatus? status,
    required BuildContext context,
  }) {
    currentStatus.value = status!;
    if (currentStatus.value == UserStatus.allStatus) {
      _fetchAllDriver(context);
      return;
    }
    _fetchFilteredDriver(status: status, context: context);
  }

  Future<void> _fetchFilteredDriver({
    required BuildContext context,
    required UserStatus status,
  }) async {
    driverManagements.clear();
    isLoading.value = true;
    final Either<String, List<DriverManagementViewModel>> result =
        await _repository.fetchFilteredDriver(status);
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

  final reportsItems = [
    {
      'title': 'تاییده شده 9',
      'value': '90',
      'iconPath': Assets.pngs.tickCircle.path,
      'color': Color(0xffD9F2E5),
      'backgroundColor': Color(0xff79D2A6),
    },
    {
      'title': 'ناقص 9',
      'value': '120',
      'iconPath': Assets.pngs.infoCircle.path,
      'color': Color(0xffFFE7B6),
      'backgroundColor': Color(0xffFFC34C),
    },
    {
      'title': '2 رد شده',
      'value': '150',
      'iconPath': Assets.pngs.closeCircle.path,
      'color': Color(0xffFCCFCF),
      'backgroundColor': Color(0xffF98686),
    },
    {
      'title': 'در انتظار 1',
      'value': '3',
      'iconPath': Assets.pngs.clock.path,
      'color': Color(0xffFFF6CC),
      'backgroundColor': Color(0xffFDE981),
    },
  ];

  @override
  void onReady() {
    super.onReady();
    _fetchAllDriver(Get.context!);
  }
}

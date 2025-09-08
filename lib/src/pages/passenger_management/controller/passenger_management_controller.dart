import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../infrastructures/models/enums/status_enum.dart';
import '../../../infrastructures/utils/utils.dart';
import '../../driver_management/model/enums/user_status.dart';
import '../model/passenger_management_view_model.dart';
import '../repository/passenger_management_repository.dart';

class PassengerManagementController extends GetxController {
  final Rx<UserStatus> currentStatus = Rx<UserStatus>(UserStatus.allStatus);
  final RxBool isLoading = false.obs;
  final _repository = PassengerManagementRepository();
  List<PassengerManagementViewModel> passengersManagement = [];

  Future<void> fetchAllPassenger(BuildContext context) async {
    isLoading.value = true;
    final Either<String, List<PassengerManagementViewModel>> result =
        await _repository.fetchAllDriver();
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        passengersManagement = response;
      },
    );
  }

  Future<void> onDeletePassenger({
    required String id,
    required String type,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final Either<String, String> result = await _repository.deletePassenger(
      id: id,
      type: type,
    );
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(context, text: response, status: StatusEnum.success);
        fetchAllPassenger(context);
      },
    );
  }

  @override
  void onInit() {
    fetchAllPassenger(Get.context!);
    super.onInit();
  }
}

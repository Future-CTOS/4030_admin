import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../infrastructures/commons/storage_handler.dart';
import '../../../infrastructures/models/enums/status_enum.dart';
import '../../../infrastructures/utils/utils.dart';
import '../../driver_management/model/view_models/driver_management_view_model.dart';
import '../models/view_models/driver_license_document_view_model.dart';
import '../repository/driver_license_document_repository.dart';

class DriverLicenseDocumentController extends GetxController {
  final RxBool isLoading = RxBool(false);
  int? driverId;
  final _repository = DriverLicenseDocumentRepository();
  final storage = StorageHandler();
  DriverLicenseDocumentViewModel? documentViewModel;

  Future<void> _fetchAllDriver({
    required BuildContext context,
    required int driverId,
  }) async {
    isLoading.value = true;
    final Either<String, DriverLicenseDocumentViewModel> result =
        await _repository.fetchAllDocuments(driverId);
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        documentViewModel = response;
      },
    );
  }

  @override
  void onReady() {
    _fetchAllDriver(context: Get.context!, driverId: driverId!);
    super.onReady();
  }
}

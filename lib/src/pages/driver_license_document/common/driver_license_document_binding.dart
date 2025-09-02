import 'package:get/get.dart';

import '../controller/driver_license_document_controller.dart';

class DriverLicenseDocumentBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverLicenseDocumentController());
}

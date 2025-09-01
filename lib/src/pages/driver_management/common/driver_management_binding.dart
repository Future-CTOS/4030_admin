import 'package:get/get.dart';

import '../controller/driver_management_controller.dart';

class DriverManagementBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverManagementController());
}

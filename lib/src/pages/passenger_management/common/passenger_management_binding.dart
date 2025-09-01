import 'package:get/get.dart';

import '../controller/passenger_management_controller.dart';

class PassengerManagementBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => PassengerManagementController());
}

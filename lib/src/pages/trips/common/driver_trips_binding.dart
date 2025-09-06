import 'package:get/get.dart';

import '../controller/driver_trips_controller.dart';

class DriverTripsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverTripsController());
}

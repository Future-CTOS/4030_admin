import 'package:get/get.dart';

import '../controller/passenger_trips_controller.dart';

class PassengerTripsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => PassengerTripsController());
}

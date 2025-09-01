import 'package:get/get.dart';

import '../controller/financial_management_controller.dart';

class FinancialManagementBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => FinancialManagementController());
}

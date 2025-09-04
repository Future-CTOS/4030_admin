import 'package:get/get.dart';

import '../../driver_management/model/enums/user_status.dart';

class PassengerManagementController extends GetxController {
  final Rx<UserStatus> currentStatus = Rx<UserStatus>(UserStatus.allStatus);

  Future<void> onDeletePassenger() async {}
  final mockTableData = [
    {
      "name": "مجید فرخ پور",
      "phoneNumber": "09013924517",
      "nationalCode": "2280124577",
      "date": "1403/08/15",
      "trips": "مشاهده",
      "status": "حذف",
    },
  ];
}

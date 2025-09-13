import 'package:app_4030_admin/src/infrastructures/commons/storage_handler.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
 final storage = StorageHandler();
  final mockData = [
    {
      "date": "1403/08/15",
      "name": "علی احمدی",
      "activity": "ثبت‌نام راننده",
      "status": "تایید شده",
    },
    {
      "date": "1403/08/15",
      "name": "محمد رضایی",
      "activity": "سفر",
      "status": "تکمیل شده",
    },
    {
      "date": "1403/08/15",
      "name": "فاطمه محمدی",
      "activity": "پرداخت",
      "status": "در انتظار",
    },
    {
      "date": "1403/08/15",
      "name": "فاطمه محمدی",
      "activity": "ثبت‌نام مسافر",
      "status": "لغو شده",
    },
    {
      "date": "1403/08/15",
      "name": "فاطمه محمدی",
      "activity": "سفر",
      "status": "لغو شده",
    },
  ];
}

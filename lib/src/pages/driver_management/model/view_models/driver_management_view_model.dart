import 'package:shamsi_date/shamsi_date.dart';

class DriverManagementViewModel {
  final String id;
  final String phone;
  final String name;
  final String lastName;
  final String nationalCode;
  final String date;
  final String status;

  const DriverManagementViewModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.nationalCode,
    required this.date,
    required this.status,
  });

  factory DriverManagementViewModel.fromJson(final Map<String, dynamic> json) =>
      DriverManagementViewModel(
        id: json['_id'],
        phone: json['phone'],
        name: json['name'],
        lastName: json['lastname'],
        nationalCode: json['nationalCode'],
        date: json['updatedAt'],
        status: json['status'],
      );

  String get jalaliDate {
    try {
      final DateTime dt = DateTime.parse(date);
      final Jalali j = Jalali.fromDateTime(dt);
      return "${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return date;
    }
  }
}

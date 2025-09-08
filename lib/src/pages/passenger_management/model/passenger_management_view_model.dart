import 'package:shamsi_date/shamsi_date.dart';

class PassengerManagementViewModel {
  final String id;
  final String phone;
  final String name;
  final String lastName;
  final String nationalCode;
  final String date;

  const PassengerManagementViewModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.nationalCode,
    required this.date,
  });

  factory PassengerManagementViewModel.fromJson(
    final Map<String, dynamic> json,
  ) => PassengerManagementViewModel(
    id: json['_id'],
    phone: json['phone'],
    name: json['firstName'],
    lastName: json['lastName'],
    nationalCode: json['nationalCode'],
    date: json['createdAt'],
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

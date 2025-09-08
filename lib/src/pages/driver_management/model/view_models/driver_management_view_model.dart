import 'package:shamsi_date/shamsi_date.dart';

import '../enums/user_status.dart';

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
        date: json['createdAt'],
        status: json['status'],
      );

  String get jalaliDate {
    try {
      final DateTime dt = DateTime.parse(date);
      final Jalali j = Jalali.fromDateTime(dt);
      return "${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString()
          .padLeft(2, '0')}";
    } catch (e) {
      return date;
    }
  }


}


extension UserStatusX on String {
  UserStatus toUserStatus() {
    switch (toLowerCase()) {
      case 'approved':
        return UserStatus.approved;
      case 'rejected':
        return UserStatus.rejected;
      case 'pending':
        return UserStatus.pending;
      default:
        return UserStatus.allStatus;
    }
  }
}

extension UserStatusStringX on UserStatus {
  String get asString {
    switch (this) {
      case UserStatus.approved:
        return 'approved';
      case UserStatus.rejected:
        return 'rejected';
      case UserStatus.pending:
        return 'pending';
      case UserStatus.allStatus:
        return 'allStatus';
    }
  }
}
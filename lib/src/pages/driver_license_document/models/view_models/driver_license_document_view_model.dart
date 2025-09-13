import 'document.dart';
import 'personal_info.dart';
import 'vehicle_info.dart';

class DriverLicenseDocumentViewModel {
  final PersonalInfo personalInfo;
  final VehicleInfo vehicleInfo;
  final Documents documents;

  DriverLicenseDocumentViewModel({
    required this.personalInfo,
    required this.vehicleInfo,
    required this.documents,
  });

  factory DriverLicenseDocumentViewModel.fromJson(Map<String, dynamic> json) =>
      DriverLicenseDocumentViewModel(
        personalInfo: PersonalInfo.fromJson(json['personalInfo']),
        vehicleInfo: VehicleInfo.fromJson(json['vehicleInfo']),
        documents: Documents.fromJson(json['documents']),
      );
}

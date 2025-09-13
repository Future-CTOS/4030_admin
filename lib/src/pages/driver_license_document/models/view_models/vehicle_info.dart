class VehicleInfo {
  final String system;
  final String color;
  final String licensePlate;

  VehicleInfo({
    required this.system,
    required this.color,
    required this.licensePlate,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => VehicleInfo(
    system: json['system'] ?? '',
    color: json['color'] ?? '',
    licensePlate: json['licensePlate'] ?? '',
  );
}

class PersonalInfo {
  final String name;
  final String lastname;
  final String fatherName;
  final String nationalCode;
  final String birthday;
  final String address;
  final String city;

  PersonalInfo({
    required this.name,
    required this.lastname,
    required this.fatherName,
    required this.nationalCode,
    required this.birthday,
    required this.address,
    required this.city,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      fatherName: json['fatherName'] ?? '',
      nationalCode: json['nationalCode'] ?? '',
      birthday: json['birthday'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
    );
}
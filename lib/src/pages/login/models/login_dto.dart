class AdminLoginDto {
  final String phone;
  final String password;

  const AdminLoginDto({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {'phone': phone, 'password': password};
}

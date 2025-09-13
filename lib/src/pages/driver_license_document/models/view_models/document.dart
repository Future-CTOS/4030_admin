class Documents {
  final String licenseFront;
  final String licenseBack;
  final String selfie;
  final String video;

  Documents({
    required this.licenseFront,
    required this.licenseBack,
    required this.selfie,
    required this.video,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return Documents(
      licenseFront: json['licenseFront'] ?? '',
      licenseBack: json['licenseBack'] ?? '',
      selfie: json['selfie'] ?? '',
      video: json['video'] ?? '',
    );
  }
}
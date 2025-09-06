class LoginViewModel {
  final String accessToken;

  LoginViewModel({required this.accessToken});

  factory LoginViewModel.fromJson(final Map<String, dynamic> json) =>
      LoginViewModel(accessToken: json['access_token']);
}

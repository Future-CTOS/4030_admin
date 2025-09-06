import 'dart:convert';

import 'package:either_dart/either.dart';
import '../../../infrastructures/commons/repository_urls.dart';
import '../../../infrastructures/utils/utils.dart';
import '../models/login_dto.dart';
import 'package:http/http.dart' as http;

import '../models/login_view_model.dart';

class LoginRepository {
  Future<Either<String, LoginViewModel>> login({
    required AdminLoginDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        RepositoryUrls.login,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final loginViewModel = LoginViewModel.fromJson(jsonData);
        return Right(loginViewModel);
      } else {
        return const Left('ناموفق!');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}

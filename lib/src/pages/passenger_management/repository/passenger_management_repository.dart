import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructures/commons/repository_urls.dart';
import '../../../infrastructures/commons/token_info.dart';
import '../model/passenger_management_view_model.dart';

class PassengerManagementRepository {
  Future<Either<String, List<PassengerManagementViewModel>>>
  fetchAllDriver() async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.allPassenger,
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<PassengerManagementViewModel> viewModel = jsonData
            .map(
              (e) => PassengerManagementViewModel.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList();

        return Right(viewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deletePassenger({
    required String id,
    required String type,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.delete(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.deletedUser(type: type, userId: id),
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        return Right('کاربر با موفقیت حذف شد');
      } else {
        final List<dynamic> jsonData = json.decode(response.body);
        print(jsonData);
        return const Left('خطا');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }
}

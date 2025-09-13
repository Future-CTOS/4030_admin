import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructures/commons/repository_urls.dart';
import '../../../infrastructures/commons/token_info.dart';
import '../models/view_models/driver_license_document_view_model.dart';

class DriverLicenseDocumentRepository {
  Future<Either<String, DriverLicenseDocumentViewModel>> fetchAllDocuments(
    int driverId,
  ) async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.allDocument(driverId: driverId),
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final DriverLicenseDocumentViewModel licenseViewModel =
            DriverLicenseDocumentViewModel.fromJson(jsonData);
        return Right(licenseViewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

}

import '../utils/constants.dart';
import 'app_controller.dart';
import 'storage_handler.dart';

class TokenInfo {
  static Map<String, String> authHeader() => {
    Constants.authorization:
        '${Constants.bearer} ${StorageHandler().token}',
  };
}

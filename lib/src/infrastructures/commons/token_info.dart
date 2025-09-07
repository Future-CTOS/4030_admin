import '../utils/constants.dart';
import 'app_controller.dart';

class TokenInfo {
  static Map<String, String> authHeader() => {
    Constants.authorization:
        '${Constants.bearer} ${AppController.instance.token}',
  };
}

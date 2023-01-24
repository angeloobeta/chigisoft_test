import 'package:chigisoft_test/model/models/authentication/loginResponse.dart';
import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class LoginUser {
  // function to login user
  static Future loginUser(
      {required String usernameOrEmail,
      required String password,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'Accept': "application/json",
      'Accept-Encoding':'gzip, deflate, br',
      'Connection':'keep-alive'
    };

    var data = {
      "username": usernameOrEmail,
      "password": password
    };
    var url = loginUrl;
    try {
      var respond = HttpClientHelper.post(
        Uri.parse(url),
        headers: header,
        body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) {
        debugPrint(response.toString());
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          var decoded = json.decode(parsed);

          if (LogInResponse.fromMap(decoded).id!.isNaN) {
            return 'error';
          } else {
            return LogInResponse.fromMap(decoded);
          }
        } else {
          var decoded = json.decode(parsed);
          if (decoded is Map || LoginErrorResponse.fromMap(decoded).message!.isNotEmpty) {
              return LoginErrorResponse.fromMap(decoded);
          } else {
            debugPrint(parsed);
            return 'error';
          }
        }
      });

      return respond;
    } on OperationCanceledError catch (e) {
      print(e);
    }
  }
}

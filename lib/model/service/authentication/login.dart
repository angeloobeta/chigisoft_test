import 'package:chigisoft_test/model/models/authentication/loginResponse.dart';
import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class LoginUser {
  // function to login user
  static Future loginUser(
      {required String phoneOrEmail,
      required String password,
      required String baseUrl,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'Accept': "application/json",
    };
    String splitString;
    if (int.tryParse(phoneOrEmail) != null) {
      splitString = phoneOrEmail.substring(1);
      print("The email address ${splitString}");
    }
    var data = {
      "email_or_phone_number": int.tryParse(phoneOrEmail) != null
          ? "+234${phoneOrEmail.substring(1)}"
          : phoneOrEmail,
      "password": password
    };
    var url = baseUrl + loginUserUrl;
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

          if (

          // UserLoggedInResponse.fromMap(decoded).id!.isEmpty
          true
              ) {
            return 'error';
          } else {
            return false;
            // LoginResponse.fromMap(decoded);
          }
        } else {
          var decoded = json.decode(parsed);
          if (decoded is Map
              // || LoginErrorResponse.fromMap(decoded).message!.isNotEmpty
          ) {
            return true;
              // LoginErrorRespone.fromMap(decoded);
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

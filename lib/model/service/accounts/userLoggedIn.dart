// this service is used to get the user details for bank account
import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class UserLoggedIn {
  // function to get user account details
  Future getUserAccountDetails(
      {required String userToken, required String baseUrl}) async {
    Map<String, String> header = {
      'accept': 'application/json',
      "x-api-key": "MonieTreeeKey",
      "Authorization": userToken
    };
    var url = baseUrl;
    // + userLoggedInUrl;
    var respond = get(Uri.parse(url), headers: header).then((response) {
      var parsed = response.body;
      // print("");
      // print("This is the response-body of login user data");
      // print(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = json.decode(parsed);
        return true;

        // UserLoggedInResponse.fromJson(decoded);
      } else {
        // print('i am parsed $parsed');
        return "error";
        //CreateAccountError.fromMap(decoded);
      }
    });
    return respond;
  }
}

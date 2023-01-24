import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class SignInViewModel extends BaseModel {
//? text fields
  TextEditingController loginUserController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //? error booleans
  bool userError = false; //? error booleans
  bool passwordError = false;

// ? focus Nodes
  FocusNode userFocusNode = FocusNode(); // ? focus Nodes
  FocusNode baseUrlFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

// ? function and parameters for obscure text
  bool showText = true;

  showTextFunction() {
    showText = !showText;
    notifyListeners();
  }

  // onChanged function for phone number and password
  onChangedFunction() {
    userFocusNode.addListener(() {
      if (userFocusNode.hasFocus == false) {
        userError = false;
        notifyListeners();
      }
    });

    if (int.tryParse(loginUserController.text) == null) {
      if (validateEmail.isValidEmail(loginUserController.text.trim())) {
        userError = false;
        notifyListeners();
      } else {
        userError = true;
        notifyListeners();
      }
    }
  } // onChanged function for password entry

  onChangedFunctionPassword() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordError = false;
        notifyListeners();
      }
    });
    if (isValidPassword(loginPasswordController.text.trim())) {
      passwordError = false;
      notifyListeners();
    } else {
      passwordError = true;
      notifyListeners();
    }
  }

  // login user

  loginUserAccount(context) async {
    if (loginUserController.text.isEmpty) {
      userError = true;
      notifyListeners();
    } else if (userError == true &&
        int.tryParse(loginUserController.text) != null) {
      if (loginUserController.text.isNotEmpty) {
        userError = false;
        notifyListeners();
      } else {
        userError = true;
        notifyListeners();
      }
    } else if (loginPasswordController.text.isEmpty) {
      passwordError = true;
      passwordFocusNode.requestFocus();
      notifyListeners();
    } else {
      // create account
      try {
        cancellationToken = CancellationToken();
        notifyListeners();
        // load baseUrl
          loadingDialog(context,
              text: "Kindly hold on, while we check for your account",
              onWillPop: () {
            return cancel(context);
          });
          await LoginUser.loginUser(
                  cancellationToken: cancellationToken!,
              usernameOrEmail: loginUserController.text.trim(),
                  password: loginPasswordController.text.trim())
              .then((value) async {
            if (value is LogInResponse) {
              Navigator.pop(context);
              await LocalStorage.setString(tokenKey, value.token!);
              print(" This is token ==>   ${value.token}");
              Navigator.pushReplacementNamed(context, homeAgentPage);
            } else if (value is LoginErrorResponse) {
              Navigator.pop(context);
              loaderWithClose(
                context,
                text: value.message!,
              );
              //print("error");
            }
            /* else if(value is String){
             Navigator.pop(context);
             loaderWithClose(context, text: 'Error! Unable to access host sever.',);
           }*/
          }).catchError((errorValue, stackTrace) {
            print('i am error value $errorValue');
            print(stackTrace);
            if (errorValue is SocketException) {
              Navigator.pop(context);
              loaderWithClose(
                context,
                text:
                    "Unable to complete request, kindly check your internet connection and try again",
              );
            }
            if (errorValue is FormatException) {
              loaderWithClose(context, text: errorValue.toString(), onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            } else if (errorValue is SocketException) {
              Navigator.pop(context);
              loaderWithClose(
                context,
                text:
                    "Unable to complete request, kindly check your internet connection and try again",
              );
            } else if (errorValue
                .toString()
                .contains("Null check operator used on a null value")) {
              loaderWithClose(context,
                  text:
                      'Ensure your internet connection is on and your base url is correct',
                  onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            } else if (errorValue.toString().contains(
                    'Invalid argument(s): No host specified in URI') ||
                errorValue.toString().contains('No host specified in URI') ||
                errorValue
                    .toString()
                    .contains(" The error handler of Future.catchError")) {
              loaderWithClose(context, text: 'Invalid base url', onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            }
          });
          ;
      } catch (errorValue) {
        if (errorValue is SocketException) {
          Navigator.pop(context);
          loaderWithClose(
            context,
            text:
                "Unable to complete request, kindly check your internet connection and try again",
          );
        } else if (errorValue
                .toString()
                .contains('Invalid argument(s): No host specified in URI') ||
            errorValue.toString().contains('No host specified in URI')) {
          print(errorValue);
          loaderWithClose(context, text: 'Invalid base url', onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });
        }
      }
    }
  }
}

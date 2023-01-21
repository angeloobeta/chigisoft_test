import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class SignInViewModel extends BaseModel {
//? text fields
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController baseUrlController = TextEditingController();

  //? error booleans
  bool phoneError = false; //? error booleans
  bool baseUrlError = false;
  bool passwordError = false;

// ? focus Nodes
  FocusNode phoneFocusNode = FocusNode(); // ? focus Nodes
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
    phoneFocusNode.addListener(() {
      if (phoneFocusNode.hasFocus == false) {
        phoneError = false;
        notifyListeners();
      }
    });

    if (int.tryParse(loginPhoneController.text) == null) {
      if (validateEmail.isValidEmail(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else if (int.tryParse(loginPhoneController.text) != null) {
      if (validatePhone.isValidPhone(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else {
      phoneError = true;
      notifyListeners();
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
    if (loginPhoneController.text.isEmpty) {
      phoneError = true;
      notifyListeners();
    } else if (phoneError == true &&
        int.tryParse(loginPhoneController.text) == null) {
      if (validateEmail.isValidEmail(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else if (phoneError == true &&
        int.tryParse(loginPhoneController.text) != null) {
      if (validatePhone.isValidPhone(loginPhoneController.text.trim())) {
        phoneError = false;
        notifyListeners();
      } else {
        phoneError = true;
        notifyListeners();
      }
    } else if (!isValidPassword(loginPasswordController.text.trim())) {
      passwordError = true;
      passwordFocusNode.requestFocus();
      notifyListeners();
    } else {
      // create account
      try {
        cancellationToken = CancellationToken();
        notifyListeners();
        // load baseUrl
        loadBaseurl().then((value) async {
          loadingDialog(context,
              text: "Kindly hold on, while we check for your account",
              onWillPop: () {
            return cancel(context);
          });
          await LoginUser.loginUser(
                  cancellationToken: cancellationToken!,
                  baseUrl: baseUrl,
                  phoneOrEmail: loginPhoneController.text.trim(),
                  password: loginPasswordController.text.trim())
              .then((value) async {
            if (value

                // LoginResponse
                ) {
              Navigator.pop(context);
              await LocalStorage.setString(tokenKey, value.token!);
              print(" This is token ==>   ${value.token}");

              // await LocalStorage.setString(firstName, value.firstName!);
              // await LocalStorage.setString(lastName, value.lastName!);
              // await LocalStorage.setString(phoneNumber, value.mobile!);
              // await LocalStorage.setString(accountIDString, value.id!);
              Navigator.pushReplacementNamed(context, '/homePage');
            } else if (value
                // is LoginError

                ) {
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
        });
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

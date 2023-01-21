import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class BaseModel extends ChangeNotifier {
  // drop down value
  String dropDown = "";
  List<String> dropDownList = [
    "Select",
  ];
  List<String> banks = ["Assets Microfinance bank"];

  // update drop down for list of banks
  updateBankDropDownValue() {
    dropDown = banks[0];
    notifyListeners();
  }

  // update bank selected dropDownValue
  updateBankSelectedValue(value) {
    dropDown = value;
    notifyListeners();
  }

  //
  // to get user data

  // state error
  String? stateError;

  CancellationToken? cancellationToken = CancellationToken();

  void cancel(BuildContext context) {
    cancellationToken?.cancel();
    Navigator.pop(context);
    print("request cancelled");
  }

  bool loadingPopped = false;

  updateLoadingPopped() {
    loadingPopped = true;
    notifyListeners();
    return true;
  }

  String busyText = "";
  String successText = "";

  // this variable is to ensure the text field
// error goes away when not in focus
  bool unFocusBool = false;

  updateUnFocusBool() {
    unFocusBool = true;
    notifyListeners();
  }

// account balance and account details
  String accountBalance = "0.0";
  String accountNumber = "";
// fetch user data
  fetchUserData(
    BuildContext context, {
    bool? fetchTransaction,
    int? index,
    bool? countNoOfActiveAccount,
  }) async {
    try {
      cancellationToken = CancellationToken();
      SchedulerBinding.instance?.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Center(
              child: S(
                h: 200,
                w: 200,
                child: customDialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loading(),
                        S(h: 20),
                        GeneralTextDisplay(
                          "Please hold, while we retrieve your account details",
                          white,
                          3,
                          14,
                          FontWeight.w500,
                          "",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    align: Alignment.center),
              ),
            ),
          ),
        ),
      );

      // load baseUrl
      loadBaseurl().then((value) async {
        await LocalStorage.getString(tokenKey).then((userToken) async {
          // get account balance

          await userData
              .getUserAccountDetails(userToken: userToken!, baseUrl: baseUrl)
              .then((value) async {
            if (value
                // is UserLoggedInResponse
                ) {
              Navigator.of(context).pop();
              notifyListeners();
            } else if (value is String) {
              Navigator.pop(context);
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Center(
                    child: S(
                      h: 220,
                      w: 220,
                      child: customDialog(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GeneralIconDisplay(
                                  Icons.error, error, UniqueKey(), 50),
                              S(h: 20),
                              GeneralTextDisplay(
                                "An error occur please try again",
                                white,
                                3,
                                14,
                                FontWeight.w500,
                                "",
                                textAlign: TextAlign.center,
                              ),
                              S(h: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/homePage');
                                    },
                                    child: GeneralTextDisplay(
                                      "Retry1",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                  S(w: 30),
                                  GestureDetector(
                                    onTap: () async {
                                      // await localStorage.setString(token, "");
                                      // await localStorage.setString(
                                      //     savingIdString, "");
                                      // await localStorage.setString(
                                      //     baseUrlString, "");
                                      Navigator.pushReplacementNamed(
                                          context, '/signIn');
                                    },
                                    child: GeneralTextDisplay(
                                      "sign out",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          align: Alignment.center),
                    ),
                  ),
                ),
              );
              //print("error");
            }
          }).catchError((errorValue, StackTrace) {
            print("");
            print("StackTrace ===> $StackTrace");
            print("");
            if (errorValue is SocketException) {
              Navigator.pop(context);
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Center(
                    child: S(
                      h: 250,
                      w: 250,
                      child: customDialog(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GeneralIconDisplay(
                                  Icons.error, error, UniqueKey(), 50),
                              S(h: 20),
                              GeneralTextDisplay(
                                "Unable to complete request, kindly check your internet connection and try again",
                                white,
                                5,
                                14,
                                FontWeight.w500,
                                "",
                                textAlign: TextAlign.center,
                              ),
                              S(h: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/homePage');
                                    },
                                    child: GeneralTextDisplay(
                                      "Retry2",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                  S(w: 30),
                                  GestureDetector(
                                    onTap: () async {
                                      // await LocalStorage.setString(token, "");
                                      // await LocalStorage.setString(
                                      //     savingIdString, "");
                                      // await localStorage.setString(
                                      //     baseUrlString, "");
                                      Navigator.pushReplacementNamed(
                                          context, '/signIn');
                                    },
                                    child: GeneralTextDisplay(
                                      "sign Out",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          align: Alignment.center),
                    ),
                  ),
                ),
              );
            } else {
              Navigator.pop(context);
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Center(
                    child: S(
                      h: 250,
                      w: 250,
                      child: customDialog(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GeneralIconDisplay(
                                  Icons.error, error, UniqueKey(), 50),
                              S(h: 20),
                              GeneralTextDisplay(
                                errorValue.toString(),
                                white,
                                5,
                                14,
                                FontWeight.w500,
                                "",
                                textAlign: TextAlign.center,
                              ),
                              S(h: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print(Stack);
                                      Navigator.pushReplacementNamed(
                                          context, '/homePage');
                                    },
                                    child: GeneralTextDisplay(
                                      "Retry 3 ",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                  S(w: 30),
                                  GestureDetector(
                                    onTap: () async {
                                      // await LocalStorage.setString(token, "");
                                      // await LocalStorage.setString(
                                      //     savingIdString, "");
                                      // await LocalStorage.setString(
                                      //     baseUrlString, "");
                                      Navigator.pushReplacementNamed(
                                          context, '/signIn');
                                    },
                                    child: GeneralTextDisplay(
                                      "sign Out",
                                      green,
                                      3,
                                      14,
                                      FontWeight.w400,
                                      "",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          align: Alignment.center),
                    ),
                  ),
                ),
              );
            }
          });
        });
      });
    } catch (errorValue) {
      if (errorValue is SocketException) {
        Navigator.pop(context);
        SchedulerBinding.instance?.addPostFrameCallback(
          (_) => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: S(
                h: 250,
                w: 250,
                child: customDialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GeneralIconDisplay(Icons.error, error, UniqueKey(), 50),
                        S(h: 20),
                        GeneralTextDisplay(
                          "Unable to complete request, kindly check your internet connection and try again",
                          white,
                          5,
                          14,
                          FontWeight.w500,
                          "",
                          textAlign: TextAlign.center,
                        ),
                        S(h: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/homePage');
                              },
                              child: GeneralTextDisplay(
                                "Retry4",
                                green,
                                3,
                                14,
                                FontWeight.w400,
                                "",
                              ),
                            ),
                            S(w: 30),
                            GestureDetector(
                              onTap: () async {
                                // await localStorage.setString(token, "");
                                // await localStorage.setString(
                                //     savingIdString, "");
                                // await localStorage.setString(baseUrlString, "");
                                Navigator.pushReplacementNamed(
                                    context, '/signIn');
                              },
                              child: GeneralTextDisplay(
                                "sign Out",
                                green,
                                3,
                                14,
                                FontWeight.w400,
                                "",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    align: Alignment.center),
              ),
            ),
          ),
        );
      } else {
        Navigator.pop(context);
        SchedulerBinding.instance?.addPostFrameCallback(
          (_) => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: S(
                h: 250,
                w: 250,
                child: customDialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GeneralIconDisplay(Icons.error, error, UniqueKey(), 50),
                        S(h: 20),
                        GeneralTextDisplay(
                          errorValue.toString(),
                          white,
                          5,
                          14,
                          FontWeight.w500,
                          "",
                          textAlign: TextAlign.center,
                        ),
                        S(h: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/homePage');
                              },
                              child: GeneralTextDisplay(
                                "Retry5",
                                green,
                                3,
                                14,
                                FontWeight.w400,
                                "",
                              ),
                            ),
                            S(w: 30),
                            GestureDetector(
                              onTap: () async {
                                // await localStorage.setString(token, "");
                                // await localStorage.setString(
                                //     savingIdString, "");
                                // await localStorage.setString(baseUrlString, "");
                                Navigator.pushReplacementNamed(
                                    context, '/signIn');
                              },
                              child: GeneralTextDisplay(
                                "sign Out",
                                green,
                                3,
                                14,
                                FontWeight.w400,
                                "",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    align: Alignment.center),
              ),
            ),
          ),
        );
      }
    }
  }

  String baseUrl = "https://monitree-api-backend.herokuapp.com";
  String stagingUrl = "http://13.40.89.34";
  // load base url from storage
  Future loadBaseurl() async {
    print(await LocalStorage.getString(baseUrlString));

    String? loadUrl = await LocalStorage.getString(baseUrlString);

    if (loadUrl != null && loadUrl.length > 0) {
      print("i am loadUrl" + loadUrl);
      baseUrl = loadUrl;
      notifyListeners();
    }
    print('baseUrl $baseUrl');
    return true;
  }
}

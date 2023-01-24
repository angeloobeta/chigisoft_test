import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        disposeViewModel: false,
        builder: (context, model, child) =>
            BaseUi(allowBackButton: true, allowScrolling: false, children: [
              // logo
              AdaptivePositioned(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      S(
                          h: 50,
                          w: 140,
                          child: Image.asset(
                              "assets/images/ministry_commerce.png")),
                    ],
                  ),
                  left: 0,
                  top: 160),

              // text field and sign in button
              Positioned(
                  top: sS(context).cH(height: 236),
                  bottom: 15,
                  left: 24,
                  right: 24,
                  child: SingleChildScrollView(
                    child: S(
                      w: 375,
                      h: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GeneralTextDisplay(
                              "Email or Username",
                              hexColor("7A809B"),
                              1,
                              14,
                              FontWeight.w400,
                              'email'),
                          S(h: 5),
                          // phone number
                          textAndTextField(context,
                              textInputType: TextInputType.text,
                              controller: model.loginPhoneController,
                              hint: "Enter your email", onChanged: () {
                            model.onChangedFunction();
                          },
                              inputFormatter: [],
                              errorTextActive: model.phoneError,
                              focusNode: model.phoneFocusNode,
                              prefix: null,
                              suffix: null,
                              labelText: 'Email address'),
                          S(h: 20),
                          if (model.phoneError == true &&
                              int.tryParse(model.loginPhoneController.text) !=
                                  null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                S(
                                  h: 30,
                                  w: 253,
                                  child: GeneralTextDisplay(
                                    model.loginPhoneController.text.isEmpty
                                        ? 'Empty Field: Please enter email address or phone number!'
                                        : model.loginPhoneController.text.length == 11 &&
                                                validatePhone.isValidPhone(model
                                                    .loginPhoneController.text)
                                            ? ""
                                            : model.loginPhoneController.text.length ==
                                                        11 &&
                                                    !validatePhone.isValidPhone(
                                                        model
                                                            .loginPhoneController
                                                            .text)
                                                ? "Phone number is invalid"
                                                : model.loginPhoneController
                                                            .text.isNotEmpty &&
                                                        model.loginPhoneController
                                                                .text.length <=
                                                            11
                                                    ? "You have entered ${model.loginPhoneController.text.isEmpty ? "0" : model.loginPhoneController.text.length} out of 11 digit"
                                                    : model.loginPhoneController
                                                                .text.isNotEmpty &&
                                                            model.loginPhoneController
                                                                    .text.length >
                                                                11
                                                        ? "Phone number is invalid, length is greater than 11"
                                                        : '',
                                    error,
                                    3,
                                    14,
                                    FontWeight.w400,
                                    'phone',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                S(h: 15),
                              ],
                            ),

                          if (model.phoneError == true &&
                              int.tryParse(model.loginPhoneController.text) ==
                                  null)
                            Column(
                              children: [
                                GeneralTextDisplay(
                                    model.loginPhoneController.text.isEmpty
                                        ? 'Empty Field, enter email address or phone Number!'
                                        : 'Please enter a valid email address!',
                                    error,
                                    1,
                                    14,
                                    FontWeight.w400,
                                    'email'),
                                S(h: 15),
                              ],
                            ),
                          S(h: 20),
                          GeneralTextDisplay("Password", hexColor("7A809B"), 1,
                              14, FontWeight.w400, 'email'),
                          S(h: 5),
                          // password
                          textAndTextField(context,
                              textInputType: TextInputType.text,
                              controller: model.loginPasswordController,
                              hint: "Enter a secure password", onChanged: () {
                            model.onChangedFunctionPassword();
                          },
                              inputFormatter: [],
                              errorTextActive: model.passwordError,
                              focusNode: model.passwordFocusNode,
                              obscureText: model.showText,
                              prefix: null,
                              suffix: GestureDetector(
                                  onTap: () {
                                    model.showTextFunction();
                                  },
                                  child: GeneralIconDisplay(
                                      model.showText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      const Color.fromRGBO(51, 51, 57, 1),
                                      UniqueKey(),
                                      18)),
                              labelText: 'Password'),
                          S(h: 20),
                          if (model.passwordError == true)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    S(
                                      h: 90,
                                      w: 325,
                                      child: GeneralTextDisplay(
                                        model.loginPasswordController.text
                                                .isEmpty
                                            ? 'Empty Field, enter password!'
                                            : !isValidPassword(model
                                                    .loginPasswordController
                                                    .text
                                                    .trim())
                                                ? 'Invalid password, Length must be more than 7 and contains lower case, upper case , digit and  symbol'
                                                : "",
                                        Colors.red,
                                        4,
                                        14,
                                        FontWeight.w600,
                                        'saving data',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                S(h: 15),
                              ],
                            ),
                          // forgot password

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: GeneralTextDisplay(
                                    "Forgot password?",
                                    hexColor("186F93"),
                                    1,
                                    14,
                                    FontWeight.w600,
                                    ""),
                                onTap: () {},
                              ),
                              S(w: 24)
                            ],
                          ),
                          S(h: 110),
                          // sign up

                          buttonWidget(
                              buttonColor: hexColor("186F93"),
                              textColor: white,
                              text: "Login",
                              onPressed: () {
                                print('tapped');
                                model.loginUserAccount(context);
                              }),

                          // sign in
                        ],
                      ),
                    ),
                  )),
            ]));
  }
}

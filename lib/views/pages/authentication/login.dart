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
                              controller: model.loginUserController,
                              textFieldLabel:"Enter your email",
                              hint: "Enter your email", onChanged: () {
                            model.onChangedFunction();
                          },
                              inputFormatter: [],
                              errorTextActive: model.userError,
                              focusNode: model.userFocusNode,
                              prefix: null,
                              suffix: null,
                              labelText: 'Email address'),
                          S(h: 20),
                          if (model.userError == true &&
                              int.tryParse(model.loginUserController.text) !=
                                  null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                S(
                                  h: 30,
                                  w: 253,
                                  child: GeneralTextDisplay(
                                    model.loginUserController.text.isEmpty
                                        ? 'Empty Field: Please username or phone number!'
                                        : model.loginUserController.text.length == 5
                                            ? ""
                                            : model.loginUserController.text.length ==
                                                        5
                                                ? "Username is invalid"
                                                : model.loginUserController
                                                            .text.isNotEmpty &&
                                                        model.loginUserController
                                                                .text.length <=
                                                            5
                                                    ? "You have entered ${model.loginUserController.text.isEmpty ? "0" : model.loginUserController.text.length} out of 11 digit"
                                                    : model.loginUserController
                                                                .text.isNotEmpty &&
                                                            model.loginUserController
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

                          if (model.userError == true &&
                              int.tryParse(model.loginUserController.text) ==
                                  null)
                            Column(
                              children: [
                                GeneralTextDisplay(
                                    model.loginUserController.text.isEmpty
                                        ? 'Empty Field, enter email address or username!'
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
                                          : Icons.visibility_off, grey,
                                      UniqueKey(),
                                      18)),
                              labelText: 'Password', textFieldLabel: "Enter your password"),
                          S(h: 20),
                          if (model.passwordError == true)
                            Column(
                              children: [
                                S(
                                  h: 20,
                                  w: 325,
                                  child: GeneralTextDisplay(
                                    model.loginPasswordController.text
                                            .isEmpty
                                        ? 'Empty Field, enter password!'
                                            : "",
                                    Colors.red,
                                    4,
                                    14,
                                    FontWeight.w600,
                                    'saving data',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                S(h: 30),

                              ],
                            ),
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
                              // S(w: 24)
                            ],
                          ),
                          // forgot password

                          S(h: 100),
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

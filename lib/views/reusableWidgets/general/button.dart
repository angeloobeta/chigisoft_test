// this is the type of button used across the application

import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

Widget buttonWidget(
    {required String text,
    required Function onPressed,
    double? width,
    Color? textColor,
    Color? buttonColor,
    Widget? child}) {
  return ButtonWidget(() {
    onPressed();
  },
      buttonColor ?? green,
      width ?? 327,
      52,
      Stack(
        children: [
          Center(
            child: GeneralTextDisplay(
                text, textColor ?? black, 1, 16, FontWeight.w600, "button"),
          ),
          child ?? S()
        ],
      ),
      Alignment.center,
      8);
}

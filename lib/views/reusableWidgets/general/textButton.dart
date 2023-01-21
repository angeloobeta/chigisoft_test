import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

Widget textButton(
    {required String text,
    required Function onPressed,
    required bool addIcon,
      bool? align,
    IconData? icon,
    Color? iconColor,
    Color? textColor,
    Color? buttonColor,
    Widget? child,
    double? radius,
    double? textSize,
    double? width,
    double? height}) {
  return Container(
    width: width ?? 327,
    height: height ?? 30,
    decoration: BoxDecoration(
        color: buttonColor, borderRadius: BorderRadius.circular(radius ?? 10)),
    child: Center(
      child: Row(
        mainAxisAlignment: align == true ?MainAxisAlignment.start :MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: GeneralTextDisplay(text, textColor ?? black, 1, textSize ?? 14,
                FontWeight.w600, "button"),
          ),
          if (addIcon == true)
            GeneralIconDisplay(icon ?? Icons.keyboard_arrow_down,
                iconColor ?? hexColor("646A86"), UniqueKey(), 25)
        ],
      ),
    ),
  );
}

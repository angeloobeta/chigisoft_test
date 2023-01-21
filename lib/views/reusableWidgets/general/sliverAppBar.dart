import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class sliverAppBar extends StatelessWidget with PreferredSizeWidget {
  final Color? backgroundColor;
  final double? elevation;
  final Widget? title;
  final Function? onPress;
  final List<Widget>? actions;
  const sliverAppBar(
      {Key? key,
      this.backgroundColor,
      this.onPress,
      this.elevation,
      this.title,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor ?? white,
      elevation: 10,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/ministry_commerce.png",
            scale: 3,
          ),
          S(w: 20),
          textButton(
              text: "Agent",
              textColor: hexColor("531423"),
              buttonColor: hexColor("FFDCE5"),
              onPressed: () {},
              width: 70,
              height: 25,
              addIcon: false)
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GeneralIconDisplay(
              Icons.menu, hexColor("646A86"), UniqueKey(), 35),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';


class BoxContainer extends StatelessWidget {
  const BoxContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: hexColor("E7F0F4"),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GeneralTextDisplay("Revenue", hexColor("186F93"), 1, 16,FontWeight.w600, ""),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:120.0, right: 20),
                  child: textButton(width: 100,iconColor: white,buttonColor: hexColor("186F93"), textColor: white,text: "Today", onPressed: (){}, addIcon: true),
                )

              ],),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GeneralTextDisplay("₦ 4,000,000.00", hexColor("0E465D"), 1, 28,FontWeight.w600, ""),
                S(h: 15),
                GeneralTextDisplay("REVENUE COLLECTED", hexColor("0E465D"), 1, 12,FontWeight.w600, ""),


              ],),
          ),
        ],
      ),
    );
  }
}

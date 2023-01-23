import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';


class BusinessDetail extends StatelessWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) =>   BaseUi(
          allowScrolling: true,
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 30,left: 20.0, right: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                DetailBox(),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      S(h:30),
                      GeneralTextDisplay("Address", hexColor("7A809B"), 1, 13, FontWeight.bold, ""),
                      S(h: 8),
                      GeneralTextDisplay("14 Ogboko Street, Mgbuoba \nObio-Akpor", hexColor("374072"), 2, 16, FontWeight.w800, ""),
                      S(h: 20),
                      GeneralTextDisplay("L.G.A", hexColor("7A809B"), 1, 13, FontWeight.bold, ""),
                      S(h: 8),
                      GeneralTextDisplay("Obio-Akpor", hexColor("374072"), 1, 16, FontWeight.w800, ""),
                      S(h: 20),
                      GeneralTextDisplay("Ward", hexColor("7A809B"), 1, 13, FontWeight.bold, ""),
                      S(h: 8),
                      GeneralTextDisplay("Obio-Akpor", hexColor("374072"), 1, 16, FontWeight.w800, ""),
                      S(h: 20),
                      GeneralTextDisplay("Phone", hexColor("7A809B"), 1, 13, FontWeight.bold, ""),
                      S(h: 8),
                      GeneralTextDisplay("08012345678", hexColor("374072"), 1, 16, FontWeight.w800, ""),
                                        S(h: 20),
                      GeneralTextDisplay("Email", hexColor("7A809B"), 1, 13, FontWeight.bold, ""),
                      S(h: 8),
                      GeneralTextDisplay("08012345678", hexColor("374072"), 1, 16, FontWeight.w800, ""),


                    ],
                  ),
                )
              ]),

            ),



          ],
        ));
  }
  }


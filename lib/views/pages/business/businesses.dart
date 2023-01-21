import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class Businessess extends StatelessWidget {
  const Businessess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => BaseUi(
              allowScrolling: true,
              children: [
                AdaptivePositioned(
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GeneralTextDisplay(
                                  "BUSINESSES",
                                  hexColor("7C8191"),
                                  1,
                                  10,
                                  FontWeight.w600,
                                  "business"),
                              S(h: 10),
                              GeneralTextDisplay(
                                  "All businesses",
                                  hexColor("262626"),
                                  1,
                                  18,
                                  FontWeight.w600,
                                  "business")
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: textButton(
                            text: "All businesses",
                            textColor: hexColor("646A86"),
                            onPressed: () {},
                            radius: 4,
                            height: 50,
                            width: 150,
                            buttonColor: hexColor("DEDEDF"),
                            addIcon: true),
                      )
                    ],
                  ),
                  top: 30,
                  left: 20,
                ),
                AdaptivePositioned(
                  Row(
                    children: [
                      textAndSearchField(context,
                          labelText: "Search people",
                          textInputType: TextInputType.text,
                          controller: TextEditingController(),
                          hint: "Search Messages",
                          borderRadius: 5,
                          textFieldLabel: "Search business places",
                          prefixIcon: GeneralIconDisplay(Icons.search_outlined,
                              hexColor('646A86'), UniqueKey(), 30),
                          onChanged: () {},
                          inputFormatter: [],
                          enabled: false,
                          errorTextActive: false,
                          focusNode: FocusNode(),
                          borderColor: const Color.fromRGBO(231, 231, 231, 1),
                          prefix: null,
                          outLineBorderColor: hexColor('BDBDBD')),
                    ],
                  ),
                  left: 15,
                  top: 140,
                ),
              ],
            ));
  }
}

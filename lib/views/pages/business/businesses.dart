import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';


class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => BaseUi(
          appBar: const sliverAppBar(),
          allowScrolling: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        AdaptivePositioned(
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GeneralTextDisplay(
                                          "BUSINESS",
                                          hexColor("7C8191"),
                                          1,
                                          10,
                                          FontWeight.w600,
                                          "business"),
                                      S(h: 10),
                                      GeneralTextDisplay(
                                          "All Businesses",
                                          hexColor("DEDEDF"),
                                          1,
                                          18,
                                          FontWeight.w600,
                                          "business")
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: textButton(
                                    text: " +  Business Place",
                                    textColor: white,
                                    textSize: 16,
                                    onPressed: () {},
                                    radius: 4,
                                    height: 50,
                                    width: 150,
                                    buttonColor: hexColor("186F93"),
                                    addIcon: false),
                              )
                            ],
                          ),
                          top: 30,
                          left: 20,
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(bottom:20.0, left: 20),
                    child: AdaptivePositioned(
                      Row(
                        children: [
                          textAndSearchField(context,
                              width: 300,
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
                      left: 25,
                      top: 140,
                      right: 15,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        textButton(radius:5,  align: true,  width:double.maxFinite, height: 45,text: "NAME", onPressed: (){}, buttonColor: hexColor("E7EAF4"),addIcon: false),
                        AdaptivePositioned(
                          ExpansionPanelList(
                            expansionCallback: (index, isExpanded) {model.isExpanded(index, isExpanded);},
                            children: model.paragraphs.map((items) => ExpansionPanel(
                              canTapOnHeader: true,
                                isExpanded : items.isExpanded,
                                headerBuilder: (context, isExpanded) =>
                                    ListTile(
                                      title: Text(items.headers!),
                                    ),
                                body: ListTile(title: Text(items.body!))))
                                .toList(),
                          ),
                          left: 300,
                          top: 80,
                        ),
                      ],
                    ),
                  ),
                  AdaptivePositioned(
                    textButton(radius:1,  width:double.maxFinite, height:70,text: "+ Business place", onPressed: (){}, buttonColor: hexColor("186F93"),addIcon: false, textColor: white, textSize: 16,),
                    left: 0,
                    top: 500,
                    right: 0,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

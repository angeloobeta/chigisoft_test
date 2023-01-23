import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';


class HomeAgent extends StatelessWidget {
  const HomeAgent({Key? key}) : super(key: key);

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
                                              "DASHBOARD",
                                              hexColor("7C8191"),
                                              1,
                                              10,
                                              FontWeight.w600,
                                              "business"),
                                          S(h: 10),
                                          GeneralTextDisplay(
                                              "Overview",
                                              hexColor("262626"),
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
                        padding: const EdgeInsets.only(left:20.0),
                        child: AdaptivePositioned(
                          Row(
                            children: const [
                              BoxContainer()
                            ],
                          ),
                          left: 25,
                          top: 140,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                        child: AdaptivePositioned(
                           SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // add new beneficiary
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: sS(context)
                                          .cW(width: 150),
                                      height: sS(context)
                                          .cH(height: 90),
                                      alignment: Alignment.center,

                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius
                                              .all(Radius.circular(
                                              sS(context).cH(
                                                  height: 5))),

                                          color:hexColor("FFFFFF"),
                                                boxShadow: [
                                                BoxShadow(
                                                color: hexColor("FD6B6D"),
                                                // spreadRadius: 5,
                                                // blurRadius: 7,
                                                offset: const Offset(0, 1), // changes position of shadow
                                                ),
                                                ],
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              GeneralIconDisplay(
                                                  FontAwesomeIcons.plus,
                                                  hexColor("FD6B6D"),
                                                  UniqueKey(),
                                                  26.67),
                                            ],
                                          ),
                                          Row(
                                            children: [Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [GeneralTextDisplay("1", black, 1, 18, FontWeight.w600, ""),
                                            GeneralTextDisplay("Applications", black, 1, 13, FontWeight.w600, "")
                                            ],
                                          )],)
                                        ],
                                      ),
                                    ),
                                  ),
                                  S(w: 5),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: sS(context)
                                          .cW(width: 150),
                                      height: sS(context)
                                          .cH(height: 90),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .all(Radius.circular(
                                              sS(context).cH(
                                                  height: 5))),
                                          color:hexColor("FFFFFF"),
                                        boxShadow: [
                                          BoxShadow(
                                            color: hexColor("FFEAB6"),
                                            // spreadRadius: 5,
                                            // blurRadius: 7,
                                            offset: const Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              GeneralIconDisplay(
                                                  FontAwesomeIcons.plus,
                                                  hexColor("FFEAB6"),
                                                  UniqueKey(),
                                                  26.67),
                                            ],
                                          ),
                                          Row(
                                            children: [Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [GeneralTextDisplay("50,675", black, 1, 18, FontWeight.w600, ""),
                                                GeneralTextDisplay("My Business", black, 1, 13, FontWeight.w600, "")
                                              ],
                                            )],)
                                        ],
                                      ),
                                    ),
                                  ),
                                  S(w: 5),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: sS(context)
                                          .cW(width: 150),
                                      height: sS(context)
                                          .cH(height: 90),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: hexColor("D1F7C4"),
                                              // spreadRadius: 5,
                                              // blurRadius: 7,
                                                offset: const Offset(0, 1), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius
                                              .all(Radius.circular(
                                              sS(context).cH(
                                                  height: 5))),
                                          color:hexColor("FFFFFF")),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              GeneralIconDisplay(
                                                  FontAwesomeIcons.plus,
                                                  hexColor("D1F7C4"),
                                                  UniqueKey(),
                                                  26.67),
                                            ],
                                          ),
                                          Row(
                                            children: [Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [GeneralTextDisplay("12", black, 1, 18, FontWeight.w600, ""),
                                                GeneralTextDisplay("Sub-Agents", black, 1, 13, FontWeight.w600, "")
                                              ],
                                            )],)
                                        ],
                                      ),
                                    ),
                                  ),
                                  S(w: 5),

                                ],
                              )),
                          top: 80,
                          left: 20,

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            textButton(radius:5,  align: true,  width:double.maxFinite, height: 45,text: "NAME", onPressed: (){}, buttonColor: hexColor("E7EAF4"),addIcon: false),
                            AdaptivePositioned(
                              ExpansionPanelList.radio(
                                children: model.paragraphs
                                    .map((items) => ExpansionPanelRadio(
                                        value: items,
                                        headerBuilder: (context, isExpanded) =>
                                            ListTile(
                                              title: Text(items.headers!),
                                            ),
                                        body: ListTile(title: Text(items.body!))))
                                    .toList(),
                              ),
                              left: 300,
                              top: 500,
                            ),
                          ],
                        ),
                      ),
                      AdaptivePositioned(
                        textButton(radius:1,  width:double.maxFinite, height:70,text: "+ Business place", onPressed: (){}, buttonColor: hexColor("186F93"),addIcon: false, textColor: white, textSize: 16,),
                        left: 0,
                        top: 800,
                        right: 0,
                      )
                    ],
                  ),
                )
              ],
            ));
  }
}

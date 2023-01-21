import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';



class DetailBox extends StatelessWidget {
  const DetailBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return S(h:270, w: 339,child: Column(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            color: hexColor("135B79"),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Expanded(
                  flex:1,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [

            ],)),
            Expanded(
              flex: 3,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralTextDisplay("Paragraph Limited", hexColor("D0F0FD"), 1, 28,FontWeight.w600, ""),
                S(h:10),
                textButton(width :130,height: 20, radius: 20, align: true, text: "Informal sector", buttonColor: hexColor("D0F0FD"),textColor:hexColor("335F71"),onPressed: (){}, addIcon: false),
                S(h:10),
                GeneralTextDisplay("ID: MCI-23-02-00001", hexColor("D0F0FD"), 1, 20, FontWeight.w800, "")
              ],),)],
          ),
        ),
        Container(
          height: 60,
            decoration: BoxDecoration(
                color: white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),child: Padding(
              padding: const EdgeInsets.only(left:25.0, right: 30),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
               DottedBorder(
              radius: const Radius.circular(5),
              borderType: BorderType.RRect,
                   color: hexColor("186F93"),
                   child: Padding(
                     padding: const EdgeInsets.only(left:2.0, right: 15.0,bottom: 8, top: 8),
                     child: Text('General Informationon', style: TextStyle(color: hexColor("186F93"),fontSize: 14),),
                   )),
          Padding(
            padding: const EdgeInsets.only(left:2.0, right: 15.0),
            child: Text("Applications",style: TextStyle(color:hexColor("646A86"))),
          )],),
            ),)
      ],
    ),);
  }
}

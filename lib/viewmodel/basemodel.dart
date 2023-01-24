import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class BaseModel extends ChangeNotifier {

  CancellationToken? cancellationToken = CancellationToken();

  void cancel(BuildContext context) {
    cancellationToken?.cancel();
    Navigator.pop(context);
    print("request cancelled");
  }


  String baseUrl = "https://dummyjson.com/";
  // load base url from storage
  Future loadBaseurl() async {
    print(await LocalStorage.getString(baseUrlString));

    String? loadUrl = await LocalStorage.getString(baseUrlString);

    if (loadUrl != null && loadUrl.length > 0) {
      print("i am loadUrl" + loadUrl);
      baseUrl = loadUrl;
      notifyListeners();
    }
    print('baseUrl $baseUrl');
    return true;





  }



  static const String loremLipsum =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "
      "unknown printer took a galley of type and scrambled it to make a type specimen book. It has "
      "survived not only five centuries, but also the leap into electronic typesetting, remaining "
      "essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets "
      "containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus "
      "PageMaker including versions of Lorem Ipsum.";

  List<Items> paragraphs = [
    Items(headers: "Paragraph 1", body: loremLipsum),
    Items(headers: "Paragraph 2", body: loremLipsum),
    Items(headers: "Paragraph 3", body: loremLipsum),
    Items(headers: "Paragraph 4", body: loremLipsum),
    Items(headers: "Paragraph 5", body: loremLipsum),
    Items(headers: "Paragraph 7", body: loremLipsum),
    Items(headers: "Paragraph 8", body: loremLipsum),
    Items(headers: "Paragraph 9", body: loremLipsum),
    Items(headers: "Paragraph 10", body: loremLipsum),
    Items(headers: "Paragraph 11", body: loremLipsum),
    Items(headers: "Paragraph 12", body: loremLipsum),
    Items(headers: "Paragraph 13", body: loremLipsum),
    Items(headers: "Paragraph 14", body: loremLipsum),
    Items(headers: "Paragraph 15", body: loremLipsum),
    Items(headers: "Paragraph 16", body: loremLipsum),
    Items(headers: "Paragraph 17", body: loremLipsum),
    Items(headers: "Paragraph 18", body: loremLipsum),
    Items(headers: "Paragraph 19", body: loremLipsum),
    Items(headers: "Paragraph 20", body: loremLipsum),
  ];

  isExpanded(index, bool isExpanded){
    paragraphs[index].isExpanded = !isExpanded;
    notifyListeners();
  }
}

class Items {
  final String? headers;
  final String? body;
  bool isExpanded;
  Items({required this.headers, required this.body, this.isExpanded=false});

  final Map<String, String> item = {
    "headers": "$Items.headers",
    "body": "$Items.body"
  };
  Map<String, String> get getItems => item;
}

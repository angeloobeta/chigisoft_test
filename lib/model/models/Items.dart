class Items {
  final String? headers;
  final String? body;
  Items({required this.headers, required this.body});

  final Map<String, String> item = {
    "headers": "$Items.headers",
    "body": "$Items.body"
  };
  Map<String, String> get getItems => item;
}

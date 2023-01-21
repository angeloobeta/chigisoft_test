import 'flutterImport.dart';

class ListViewSeparated extends StatelessWidget {
  final List<Widget>? children;
  const ListViewSeparated({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: const Text("Paragraph Ltd."),
          children: children ?? [],
        );
      },
    );
  }
}

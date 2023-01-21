import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => const BaseUi(
              allowScrolling: true,
              children: [],
            ));
  }
}

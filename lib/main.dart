import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // @overrides
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Sorosoke',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primarySwatch: MaterialColor(
              hexOfRGBA(64, 76, 207, opacity: 1), primarySwatchColor),
        ),
        // home: SignIn()
        // home: HomePage()
        // home: const Businessess());
        home: const HomeAgent());
  }
}

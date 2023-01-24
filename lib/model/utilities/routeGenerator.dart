import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {

    // login page
      case homeAgentPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const
          HomeAgent(),
        );

      // login page
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const
          SignIn(),
        );

      // business page
      case businessPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Business(),
        );

      // business info page
      case businessInfoPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BusinessInfo(),
        );

      //chatM
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

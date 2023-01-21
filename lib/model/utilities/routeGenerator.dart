import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {

      // // chatHomePage pages
      // case chatHomePage:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const
      //     ChatHomePage(),
      //   );

      // chatNewMessage page
      // case newMessagePage:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const NewMessagePage(),
      //   );

      // chatRecentMessage page
      // case recentMessagePage:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const RecentMessagePage(),
      //   );

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

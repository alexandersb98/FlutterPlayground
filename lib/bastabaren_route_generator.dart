import 'package:flutter/material.dart';
import 'package:flutter_playground/bastabaren.dart';
import 'package:flutter_playground/routes.dart';

class RouteGeneratorBB {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => BastaBarenHome());
      case Routes.SEARCH_RESULTS:
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SearchResultsPubs(search_term: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
            child: Text('Something went wrong trying to route!')
        ),
      );
    });
  }
}
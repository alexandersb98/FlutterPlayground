import 'package:flutter/material.dart';
import 'package:flutter_playground/resocoder_routes_tutorial.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     final args = settings.arguments;

     switch (settings.name) {
       case '/':
         return MaterialPageRoute(builder: (_) => FirstPage());
       case '/second':
         if (args is String) {
           return MaterialPageRoute(builder: (_) => SecondPage(data: args));
         }
         // If args is not of the correct type, return an error page.
         return _errorRoute();
       default:
         return _errorRoute();
     }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(

        ),
        body: const  Center(
          child: Text('Something went wrong!')
        ),
      );
    });
  }
}
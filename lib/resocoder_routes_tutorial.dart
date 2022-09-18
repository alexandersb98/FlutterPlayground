import 'package:flutter/material.dart';
import 'package:flutter_playground/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App')
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/second', arguments: 'Hello there from the first page!'),
              child: Text('Go to second')),
          ],
        )
      )
    );
  }
}

class SecondPage extends StatelessWidget {

  final String data;

  SecondPage({
    Key? key,
    required this.data,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Second page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            )
          ],
        )
      )
    );
  }
}
